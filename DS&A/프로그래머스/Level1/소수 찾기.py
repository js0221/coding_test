# 풀이 1 : 에라토스테네스의 체
# 소수의 배수는 모두 제외한다
def solution(n):
    arr = [1]*(n+1)
    arr[0], arr[1] = 0, 0
    i = 2
    
    while i<n:
        if arr[i] == 1:
            multiple = 2
            while i*multiple <= n:
                arr[i*multiple] = 0
                multiple += 1
        i += 1
        
    return sum(arr)

# 풀이 2
def solution(n):
    num=set(range(2,n+1))

    for i in range(2,n+1):
        if i in num:
            num-=set(range(2*i,n+1,i))
            # start,stop,step : i의 2배인 수부터 시작해서 i씩 증가
            # range로 만든 set을 num에서 제외
    return len(num)
