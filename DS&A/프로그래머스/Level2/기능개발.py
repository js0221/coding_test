from math import ceil

def solution(progresses, speeds):
    max_day = ceil((100 - progresses[0]) / speeds[0])
    deployment = 0
    answer = []
    
    '''
    while dq:
        day = dq.popleft()
    # 어차피 순회하는 것이므로, while 쓰지말고 for loop으로 처리
    '''
    for p, g in zip(progresses, speeds):
        day = ceil((100 - p) / g)
        
        #----------------------------------------
        '''
        if max_day >= day:
            deployment += 1
        else:
            max_day = day
            answer.append(deployment)
            deployment = 1
        '''
        if max_day < day:
            answer.append(deployment)
            max_day = day
            deployment = 0
        deployment += 1
        #----------------------------------------
            
    answer.append(deployment)  # 마지막으로 안 넣은 배포일을 추가

    return answer


'''
# 리스트의 특성을 이용한 풀이
from math import ceil

def solution(progresses, speeds):
    answer = [[ceil((100 - progresses[0]) / speeds[0]), 0]]
    # answer = [[진도율, 배포되는 기능 수]]
    
    for progress, speed in zip(progresses, speeds): # 첫 번째 기능 부터 비교
        duration = ceil((100 - progress) / speed)
        if answer[-1][0] < duration: # 배열의 끝에 있는 진도율과 비교
            answer.append([duration, 0]) # 새로 들어오는 진도율이 duration이 크면, 이전 것들은 배포하고, 새로 배포 기능 수 계산
        answer[-1][1] += 1
    
    return [count for _, count in answer]
'''
