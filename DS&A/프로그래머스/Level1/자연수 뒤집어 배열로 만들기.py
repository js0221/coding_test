def digit_reverse(n):
    return list(map(int, reversed(str(n))))
  
def digit_reverse(n):
    return [int(i) for i in str(n)][::-1]
  
def solution(n):
    arr = list(map(int, str(n)))
    print(arr)
    l = 0
    r = len(arr)-1
    
    while l<r:
        arr[l], arr[r] = arr[r], arr[l]
        l += 1
        r -= 1
    print(arr)
    return arr
