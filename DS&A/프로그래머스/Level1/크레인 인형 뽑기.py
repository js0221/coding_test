def solution(board, moves):
    # 행열전치 : zip > 튜플이니까 list로 map > map객체를 리스트로
    l = list(map(list,zip(*board)))
    l2 = []
    for i in l:
        while 0 in i:
            i.remove(0)
        i.reverse()
        l2.append(i)

    # 작동
    stack = []
    count = 0
    for i in moves:
        if l2[i-1]:
            tmp = l2[i-1].pop()
            # 스택이 있고, tmp랑 스택 꼭대기 같으면
            if stack and tmp == stack[-1]:
                # 스택 팝시키고 카운트 플러스 2
                stack.pop()
                count += 2
            # 스택이 없거나 이거 아니면 어팬드
            else:
                stack.append(tmp)
    return count
