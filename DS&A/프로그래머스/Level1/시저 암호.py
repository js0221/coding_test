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
