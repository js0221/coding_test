# 리턴에서 if문 바로 쓰기
def solution(x):
    a = 0
    for i in str(x):
        a += int(i)
    return True if x % a == 0 else False


# 다른 풀이
#    return x % sum([int(c) for c in str(x)]) == 0
