from heapq import heapify, heappop, heappush
def solution(n, works):
    if sum(works) <= n:
        return 0
    
    works = [-i for i in works]
    heapify(works)
    
    for _ in range(n):
        max_work = -1 * heappop(works)
        heappush(works, -1*(max_work-1))
    
    return sum([i ** 2 for i in works])
