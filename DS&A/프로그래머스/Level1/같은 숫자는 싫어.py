def solution(arr):
    answer = []
    for i in arr:
        if answer[-1:] != [i]:
            answer.append(i)
    return answer

'''
# 슬라이싱을 하면, 리스트를 반환한다.
a[-1] == i 이렇게 풀면 처음에 빈 리스트이기 때문에 오류나지만
a[-1:] == [i] 슬라이싱으로 리스트를 비교하면 오류 안남

# 처음 풀이
def solution(arr):
    answer = [arr[0]]
    for i in arr:
        if answer and answer[-1] != i:
            answer.append(i)
        elif not answer:
            answer.append(i)

    return answer
'''

