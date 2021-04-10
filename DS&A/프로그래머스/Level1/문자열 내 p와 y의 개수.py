def solution(s):
    p, y = 0, 0
    for x in s:
        if x == 'p' or x =='P':
            p += 1
        if x == 'y' or x == 'Y':
            y += 1
    return True if p == y else False

# 다른 풀이
def numPY(s):
    return s.lower().count('p') == s.lower().count('y')
