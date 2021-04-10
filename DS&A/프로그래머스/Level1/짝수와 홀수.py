def solution(num):
    return 'Even' if num % 2 == 0 else 'Odd'

# 다른 풀이
def evenOrOdd(num):
    return ["Even", "Odd"][num & 1]
    # [리스트][인덱스 0 or 1 : 비트연산]
