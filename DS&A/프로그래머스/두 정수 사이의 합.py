def solution(a, b):
    answer = 0
    if a > b:
        a, b = b, a
    for i in range(a, b+1):
        answer += i
    return answer
  
# 다른 풀이 : return sum(range(a,b+1))
