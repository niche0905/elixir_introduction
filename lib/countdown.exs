
# Stream.resource
# 다른 종류의 리소스인 '시간'을 생각할 때
# Stream.resource를 사용해 분 단위가 바뀌기 까지 남을 시간을 초 단위로 세는 타운트다운 타이머를 구현해보자
# 자원을 할당받기 위한 첫 번째 함수에서는 남은 시간을 초 단위로 반환한다
# 이 함수는 스트림이 실제로 계산될 때마다 실행되므로, 반환하는 카운트다운 값은 언제 호출되는지에 따라 다르다
# 반복 호출되는 두 번째 함수에서는 남은 시간을 관리한다
# 정각이면 {:halt, 0} 튜플을 반환하고, 정각이 아니면 1초간 기다린 후 최신 카운트다운 값을 담은 문자열과 갱신된 카운터를 반환한다
# 이 예제에서는 리소스 할당을 해제할 필요가 없으므로 세 번째 함수는 아무 동작도 하지 않는다

defmodule Countdown do

  def sleep(seconds) do
    receive do
    after seconds * 1000 -> nil
    end
  end

  def say(text) do
    spawn(fn  -> :os.cmd('ptts #{text}') end)
  end

  def timer do
    Stream.resource(
      fn  -> # 분 단위가 바뀔 때까지 남은 초를 계산한다
        {_h, _m, s} = :erlang.time()
        60 - s - 1
      end,

      fn # 1초 뒤 카운트다운 값을 반환한다
        0 ->
          {:halt, 0}
        count ->
          sleep(1)
          { [inspect(count)], count - 1 }
      end,

      fn _ -> nil end # 할당 해제할 자원이 없음
    )
  end
end


# iex(1)> counter = Countdown.timer
# #Function<53.82544474/2 in Stream.resource/3>
# iex(2)> printer = counter |> Stream.each(&IO.puts/1)
# #Stream<[
#   enum: #Function<53.82544474/2 in Stream.resource/3>,
#   funs: [#Function<38.82544474/1 in Stream.each/2>]
# ]>
# iex(3)> speaker = printer |> Stream.each(&Countdown.say/1)
# #Stream<[
#   enum: #Function<53.82544474/2 in Stream.resource/3>,
#   funs: [#Function<38.82544474/1 in Stream.each/2>,
#    #Function<38.82544474/1 in Stream.each/2>]
# ]>
# iex(4)> speaker |> Enum.take(5)
# 23
# 22
# 21
# 20
# 19
# ["23", "22", "21", "20", "19"]

# 이 코드는 코드가 실행되며 생기는 지연을 sleep 함수에서 보정하지 못해서 좋은 코드는 아니다
# 하지만 스트림을 이용하면 비동기적인 리소스를 쉽게 다룰 수 있다는 점으 배울 만하다
# 또 스트림을 사용할 때마다 초기화되므로 사이드 이펙트를 일으킬 염려가 없다는 점 역시 알아두어라
# 스트림을 파이프로 Enum 함수와 연결할 때마다 새롭게 계산된 값을 받을 수 있다
