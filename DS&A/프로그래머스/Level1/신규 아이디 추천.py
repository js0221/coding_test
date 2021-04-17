def solution(new_id):
    # 1단계
    new_id = new_id.lower()
    
    # 2단계
    tmp = ''
    for i in new_id:
        if i.isalpha() or i.isdigit() or i == '-' or i == '_' or i =='.':
        # 다른 풀이 : i in ['-', '_', '.']
            tmp += i
    new_id = tmp

    # 3단계
    while '..' in new_id:
        new_id = new_id.replace('..', '.')
        
    # 4단계
    if new_id: 
        if new_id[0] == '.':
            new_id = new_id[1:]
    if new_id:
        if new_id[-1] == '.':
            new_id = new_id[:-1]

    # 5단계
    if not new_id:
        new_id += 'a'

    # 6단계:
    if len(new_id) >= 16:
        new_id = new_id[:15]
        if new_id[-1] == '.':
            new_id = new_id[:14]
        
    # 7단계:
    if len(new_id) <= 2:
        while len(new_id) <3:
            new_id = new_id + new_id[-1]

    return new_id
