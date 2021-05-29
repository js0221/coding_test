from heapq import _heapify_max, _heappop_max
    def solution(no, works):
    if no >= sum(works): # 일의 총 시간 합이, no보다 작으면 0으로 만들 수 있다.
        return 0
        
     _heapify_max(works) # 제일 큰 수 찾기
    for _ in range(no):
        max_works = _heappop_max(works)
        max_works -= 1
        works.append(max_works)

    return sum([i ** 2 for i in works])
