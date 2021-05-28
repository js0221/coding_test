from math import ceil

def solution(progresses, speeds):
    max_day = ceil((100 - progresses[0]) / speeds[0])
    deployment = 0
    answer = []
    
    for p, g in zip(progresses, speeds):
        day = ceil((100 - p) / g)
        if max_day >= day:
            deployment += 1
        else:
            max_day = day
            answer.append(deployment)
            deployment = 1
            
    answer.append(deployment)  # 마지막으로 안 넣은 배포일을 추가

    return answer
