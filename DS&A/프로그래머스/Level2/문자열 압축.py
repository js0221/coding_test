from math import ceil
def solution(s):
    length = []
    
    # 예외: 길이가 1일 때
    if len(s) == 1:
        return 1

    #------------------------------------------------------------------------------
    for i in range(1, len(s) // 2 + 1):     # i : 잘라야 하는 단위 길이 
        prev, answer, num = '', '', 0
        
        for j in range(ceil(len(s)/i)+1):   # i 길이 만큼 자를때, 횟수 : ceil(len(s)/i)
            cut = s[j*i:(j+1)*i]            # 단위 길이 만큼 자른 것
                    
            #---------------------------------------------------------------   
            if prev != cut:                 # 이전하고 같지 않으면, 정답에 이어 붙인다.
                if num != 1:                # 연속되는 것이 1개가 아니면 숫자도 같이 이어 붙인다
                    answer += str(num)
                answer += prev
                prev, num = cut, 0          # prev를 cut으로 바꿔주고, 숫자 0으로 초기화
                
            #---------------------------------------------------------------------
            if prev == cut:                 # 연속되는 문자일 경우
                num += 1                    # num += 1

        length.append(len(answer[1:]))      # 최종적으로 길이를 배열에 추가
        
    return min(length)                      # 최소의 길이를 출력
  
  
  
def solution(s):
    answer = len(s)
    
    for size in range(1, len(s) // 2 + 1):           # 자르는 길이의 단위를 1부터 절반까지만 사용하겠다
        count = 1                                    # 반복되는 횟수
        compress = 0
        
        prev = s[:size]
        
        for i in range(size, len(s) + size, size):   # 루프를 돌리는데, size만큼씩 돌린다, len(s) + size를 안해주면 마지막이 빠지게 됨 >>> 루프를 돌린 값은 i이다
            curr = s[i:i + size]
            if prev == curr:                         # 자른 것이 이전과 같으면
                count += 1                           # count += 1
                
            else:                                    # 자른 것이 이전과 다르면
                # 문자열 길이만 알면 된다 >>> size : 자른 문자열 길이 + count를 문자로 바꿨을때 길이
                compress += size + len(str(count)) if 1 < count else len(prev) 
                prev = curr                          # 문자 바꿔주기
                count = 1                            # 카운트 초기화
                
        answer = min(answer, compress)
    
    return answer
