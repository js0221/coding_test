def solution(arr, divisor):
    l = [x for x in arr if x % divisor == 0]
    if not l:
        return [-1]
    else:
        l.sort()
        return l
    
# 다른 풀이
# return sorted([n for n in arr if n%divisor == 0]) or [-1]
