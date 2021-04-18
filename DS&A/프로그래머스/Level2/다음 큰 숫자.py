def solution(n):
    one = bin(n).count('1')    
    tmp = n+1
    while True:
        if bin(tmp).count('1') == one:
            return tmp
        tmp = tmp + 1
