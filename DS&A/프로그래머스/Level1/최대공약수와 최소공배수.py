# 풀이 1 : 유클리드 호제법
def solution(n, m):
    '''
    최대공약수
    > 두 수 중 작은 수(b)로 큰 수(a)를 나눈 나머지 & 작은 수(b)
    > a, b = b, 작은 수를 큰 수로 나눈 나머지
    > b가 0이 되기전까지 계산하여 최종적으로 a를 반환
    
    최소공배수
    > 두 수의 곱을 최대 공약수로 나눔
    '''
    a = max(n,m)
    b = min(n,m)
    while b > 0:
        a, b = b, a % b
    return [a, n*m // a]


# 풀이 2 : 파이썬 메소드
from math import gcd
def solution(n, m):
    return [gcd(n,m), n*m//gcd(n,m)]


# 풀이 3 : for문
# 최대공약수 : min부터 1씩 내려오면서 나눠서, 두개의 나머지가 모두 0이 되는 최초의 값
# 최소공배수 : 두수의 곱을 n과 m으로 나눌때, 나머지가 모두 0이되는 최초의 값
def gcd(n, m):
    for i in range(min(n,m)+1, 0, -1):
        if n % i == 0 and m % i == 0:
            return i
def lcm(n, m):
    for i in range(max(n,m), (n*m)+1):
        if i%n == 0 and i % m==0 :
            return i
