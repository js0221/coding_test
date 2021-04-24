# 풀이 1
def solution(skill, skill_trees):
    answer = 0
    for st in skill_trees:
        tmp = [s for s in st if s in skill]
        if ''.join(tmp) == skill[:len(tmp)]:
            answer += 1
    return answer

# 풀이 2
def solution(skill, skill_trees):
    answer = 0
    for st in skill_trees:
        tmp = []
        for s in skill:
            if st.find(s) == -1:
                tmp.append(26)
            else:
                tmp.append(st.find(s))

        for x in range(len(tmp)-1):
            if tmp[x] > tmp[x+1]:
                break
        else:
            answer += 1
    return answer
