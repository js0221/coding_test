# A 65 Z 90 a 97 z 122
# ord('a')-ord('z') 26
def solution(s, n):
    answer =''
    for i in s:
        tmp = ord(i) + n
        if (ord(i) <=90 and tmp >= 91) or (ord(i)>=97 and tmp >= 123):
            tmp = tmp - 26
        if ord(i) == 32:
            tmp = 32
        answer += chr(tmp)
    return answer


# 다른 풀이
def caesar(s, n):
    s = list(s)
    for i in range(len(s)):
        if s[i].isupper():
            s[i]=chr((ord(s[i])-ord('A')+ n)%26+ord('A'))
        elif s[i].islower():
            s[i]=chr((ord(s[i])-ord('a')+ n)%26+ord('a'))
            
    return "".join(s)
