
IO.puts(File.stream!("/urs/share/dict/words")) |> Enum.max_by(&String.length/1)

# 중간 결과값을 저장하지 않는다는 점은 장점이지만 실행 시간은 원래 구현보다 두 배 정도는 느려진다
# 하지만 데이터가 다른 서버나 외부 센서 (예를 들어 온도계)로부터 올 때는 괜찮은 구현이다
# 데이터가 천천히 들어오거나 끝없이 들어올 수도 있기 때문이다
# Enum으로 구현하면 데이터가 모두 들어올 때까지 기다려야 하지만, 스트림을 이용하면 데이터가 들어올 때마다 처리할 수 있다
