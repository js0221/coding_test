def solution(prices):
    r = [0] * len(prices)
    for i in range(len(prices)):
        for j in range(i+1, len(prices)):
            r[i] += 1
            if prices[i] > prices[j]:
                break
    return r

'''
# 처음 푼 풀이
# 시작할 때, 답의 개수가 정해진 배열은 append 사용하지말고 초기화 작업하여 덧셈으로 값 수정하는게 빠르다

def solution(prices):
    r = []
    for i in range(len(prices)):
        c = 0
        for j in range(i+1, len(prices)):
            c += 1
            if j == len(prices)-1:
                r.append(c)
            elif prices[i] > prices[j]:
                r.append(c)
                break
    r.append(0)
    return r
'''
