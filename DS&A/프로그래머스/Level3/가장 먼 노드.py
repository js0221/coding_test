from collections import deque
def solution(n, edge):
    board = [[] for _ in range(n + 1)]
    check = [0] * (n+1)

    for i, j in edge:
        board[i].append(j)
        board[j].append(i)

    q = deque([1])
    check[1] = 1

    while q:
        pop = q.popleft()
        for i in board[pop]:
            if check[i] == 0:
                check[i] = check[pop] + 1
                q.append(i)

    return check.count(max(check))
