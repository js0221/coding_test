from heapq import heapify, heappop, heappush
import heapq

def solution(no, works):
    if no > sum(works):
        return 0

    works = [-i for i in works] # max heap
    heapq.heapify(works) 

    for _ in range(no):
        # heappushpop 먼저 푸시하고 팝, heapreplace 먼저 팝하고 푸시
        heapq.heapreplace(works, works[0] + 1)
        '''
        max_work = -1 * heappop(works)
        heappush(works, -1*(max_work-1))
        '''
        
    return sum([i**2 for i in works])


'''
def solution(n, works):
    if sum(works) <= n:
        return 0
    
    works = [-i for i in works]
    heapify(works)
    
    for _ in range(n):
        max_work = -1 * heappop(works)
        heappush(works, -1*(max_work-1))
    
    return sum([i ** 2 for i in works])
'''
