from heapq import heapify, heappop, heappush
def solution(scoville, K):
    answer = 0
    heapify(scoville)

    while scoville[0] < K:
        try:
            heappush(scoville, heappop(scoville) + heappop(scoville) * 2)
            answer += 1
        except:
            return -1

    return answer
