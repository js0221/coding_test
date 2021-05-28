def solution(brown, yellow):
    if yellow == 1:
        return [3,3]
    
    for i in range(1, yellow//2+1):
        if yellow % i == 0:
            yx, yy = yellow // i, i
            if 2*(yx+yy)+4 == brown: 
                return [yx+2, yy+2]
                

'''
# 다른 풀이
def solution(brown, red):
    for i in range(1, int(red**(1/2))+1):
        if red % i == 0:
            if 2*(i + red//i) == brown-4:
                return [red//i+2, i+2]
'''
