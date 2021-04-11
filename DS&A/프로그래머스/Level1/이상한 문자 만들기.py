def solution(s):
    answer = []
    l = [x for x in s.split(" ")]
    for i in l:
        tmp = ''
        for idx, val in enumerate(i):
            if idx % 2 == 0:
                tmp += val.upper()
            else:
                tmp += val.lower()
        answer.append(tmp)
        
    return ' '.join(answer)
