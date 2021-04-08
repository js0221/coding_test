def solution(s):
    stack = []
    for i in s:
        if stack and i == ')' and stack[-1] == '(':
            stack.pop()
        else:
            stack.append(i)
    if not stack:
        return True
    return False
