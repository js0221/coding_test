from collections import deque
def solution(n, m, image):
    # 1. 방문한 노드, 방향 리스트 설정
    answer = 0
    visited = [[0] * m for _ in range(n)] # [[0]*m]*n 에러
    directions = [(0, 1), (0, -1), (-1, 0), (1, 0)] # []안에, 튜플 사용
    
    # 2. 탐색 (for)
    for i in range(n):
        for j in range(m):
            
            #---------------------------------
            # 방문한 곳을 찾아, 이것은 넘어가고, if문 나와서 방문하지 않은 노드에 대해 처리한다.
            # 들여쓰기를 줄일 수 있다
            if image[i][j] == float('inf'):
                continue
            target_color = image[i][j]
            queue = deque([(i, j)])
            '''
            # 방문하지 않은 노드만 탐색
            if visited[i][j] == 0: 
                # 방문표시 & 정답 += 1
                visited[i][j] = 1
                answer += 1
                
                queue = deque([[i,j]])
                
                # 3. 인접노드 탐색
                while queue:
                    ....
            '''
            while queue:
                x, y = queue.popleft()
                for dx, dy in directions:
                  
                    # 이동 좌표 : 자주 사용하므로 변수 할당
                    px = x + dx
                    py = y + dy
                    
                    if px >= n or px < 0 or py >= m or py < 0:
                        continue
                    if image[px][py] == target_color:
                        image[px][py] = float('inf')
                        queue.append((px, py))
            answer += 1

    return answer
