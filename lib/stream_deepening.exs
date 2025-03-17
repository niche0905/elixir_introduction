
# 스트림 함수
# 스트림은 홀로 독립되어 있는 엘릭서 라이브러리 중 하나이다
# 런타임에서 특별히 지원해 주는 부분이 없기 때문이다
# 실제 구현은 매우 복잡하지만 이를 춧상화한 몇가지 함수가 수고를 덜어준다
# 그 함수로는 cycle, repeatedly, iterate, unfold, resource 등이 있다


# Stream.cycle
# Stream.cycle 함수는 컬렉션을 받아 컬렉션의 항목을 담은 무한히 긴 스트림을 생성한다
# 컬렉션의 항목 순서대로 나아가다 끝에 다다르면 처음으로 돌아와 다시 반복한다

Stream.cycle(~w{ green white }) |>
Stream.zip(1..5) |>
Enum.map(fn {class, value} -> "<tr class='#{class}'><td>#{value}</td></tr>\n" end) |>
IO.puts
# <tr class='green'><td>1</td></tr>
# <tr class='white'><td>2</td></tr>
# <tr class='green'><td>3</td></tr>
# <tr class='white'><td>4</td></tr>
# <tr class='green'><td>5</td></tr>

# 위 코드는 클래스를 green 또는 white로 번갈아 지정하는 HTML 테이블 코드를 생성한다


# Stream.repeatedly
# Stream.repeatedly는 함수를 받아, 새 값이 필요할 때마다 함수를 호출한다

Stream.repeatedly(fn  -> true end) |> Enum.take(3)
# [true, true, true]
Stream.repeatedly(&:random.uniform/0) |> Enum.take(3)
# [0.4435846174457203, 0.7230402056221108, 0.94581636451987]


# Stream.iterate
# Stream.iterate 함수도 무한한 스트림을 생성한다
# 처음 값은 start_value이며, 다음 값은 이 값에 함수 next_fun을 적용해 얻는다
# 이 연산은 스트림이 사용되는 한 계속 수행되며, 각 값은 이전 값에 next_fun을 적용한 값이 된다

Stream.iterate(0, &(&1 + 1)) |> Enum.take(5)
# [0, 1, 2, 3, 4]
Stream.iterate(2, &(&1 * &1)) |> Enum.take(5)
# [2, 4, 16, 256, 65536]
Stream.iterate([], &[&1]) |> Enum.take(5)
# [[], [[]], [[[]]], [[[[]]]], [[[[[]]]]]]


# Stream.unfold
# Stream.unfold는 iterate와 비슷하나, 스트림으로 내보낼 값과 다음 연산에 전달할 값을 명시적으로 분리할 수 있다는 차이가 있다
# unfold는 초기값과 함수를 받는다
# 함수는 인자를 이용해 두 개의 값을 생성해 튜플로 반환하면 되는데, 튜플의 첫번쨰 값은 이번에 스트림을 통해 이번에 내보낼 값이며, 두 번째 값은 다음 반복 때 이 함수에 전달될 값이다
# 함수가 nil을 반환하면 스트림이 종료된다

# 뜬구름 잡는 이야기처럼 들리겠지만 Stream.unfold는 꽤 쓸만하다
# 이 함수는 값이 아닌 이전 상태에 의존하는 무한한 스트림을 생성하는 범용적인 방법이다
# 여기서 가장 중요한 것은 값을 생성하는 함수이다
# 일반적인 형태는 다음과 같다
fn state -> {stream_value, new_state} end

# 다음 코너는 피보나치 수를 생성하는 스트림을 unfold를 이용해 구현한 것이다
Stream.unfold({0, 1}, fn {f1, f2} -> {f1, {f2, f1 + f2}} end) |> Enum.take(15)
# [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377]

# 여기서 스트림의 상태는 현재 피보나치 수와 다음 비보나치 수를 가진 튜플이다
# 초기 상태로는 {0, 1}을 사용하고, 매 반복마다 튜플의 첫 번째 값을 스트림으로 내보낸다
# 다음 상태는 기존 상태를 한 칸씩 옮긴 것으로, 이전 상태가 {f1, f2}였다면 다음 상태는 {f2, f1 + f2} 가 된다


# Stream.resource
# Stream.resource는 스트림과 외부에 있는 리소스가 상호작용을 할 수 있게 해준다
# stream1, 2, 3 예제에서 했던 작업을 직접 구현해보려면 이 Stream.resource를 사용하면 된다
# resource는 unfold를 기반으로 하지만 두 가지 차이가 있다
# 1. unfold의 첫 번째 인자는 반복 함수를 처음 호출할 때 전달할 값이였다
#    하지만 그 값이 어떤 자원이라면 스트림이 실제로 값을 내보내기 전까지는 그 자원에 접근하지 않는 것이 좋다
#    스트림이 만들어 지더라도 실제로 값을 내보내기까지 시간이 오래걸릴 수도 있다
#    따라서 resource는 값이 아니라 값을 반환하는 함수를 받는다
# 2. 리소스를 모두 가져온 뒤 스트림을 종료할 때의 처리와 관련이 있다
#    이를 위해 resource 함수는 세번째 인자를 받는다
#    세 번째 인자로 전달되는 함수는 마지막 상태를 받아 자원 할당을 해제하는 데 필요한 처리를 수행한다

# 라이브러리 문성에 소개된 예제 코드
Stream.resource(fn  -> File.open!("sample") end,  # 값을 반환하는 함수
                fn file ->
                  case IO.read(file, :line) do
                    data when is_binary(data) -> {[data], file}
                    _ -> {:halt, file}
                  end
                end,  # 마지막 상태를 필요한 처리를 하는 함수수
                fn file -> File.close(file) end
                )

# 파일을 열어 파일 정보를 넘김
# 파일을 줄 단위로 읽어 그 내용과 정보로 이루어진 튜플을 반환하고,
# 파일의 끝에 도달하면 :halt 튜플을 반환한다
# 마지막 함수에서 파일을 닫는다
