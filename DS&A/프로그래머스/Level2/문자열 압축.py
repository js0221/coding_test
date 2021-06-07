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
  
  
  
def solution2(s):
    answer = len(s)

    #------------------------------------------------------------------------------
    for size in range(1, len(s) // 2 + 1):        # size : 잘라야 하는 길이
        count, compress = 1, 0
        
        for i in range(size, len(s) + size, size): # size 만큼씩 step 하면서 자른다
            curr = s[i : i + size]
            
            #------------------------------------------------------------------------------
            if prev == curr:                       # 이전하고 같은 문자일 경우
                count += 1                         # count += 1
            else:
                ompress += size + len(str(count)) if 1 < count else len(prev)
                prev = curr
                count = 1
                
        answer = min(answer, compress)
        
    return answer
