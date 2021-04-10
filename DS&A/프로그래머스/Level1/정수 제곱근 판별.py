import math
def solution(n):
    return (math.sqrt(n) + 1) ** 2 if math.sqrt(n) % 1 == 0 else -1

# 다른 풀이
'''
1. n ** (1/2)
2. n ** .5
'''
