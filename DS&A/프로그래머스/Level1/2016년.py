# 풀이1 : datetime
import datetime
def getDayName(a,b):
    t = 'MON TUE WED THU FRI SAT SUN'.split() # split() 하면 리스트 됨
    return t[datetime.datetime(2016, a, b).weekday()]
    # datetime.datime(년, 월, 일) : 객체 만들기
    # .weekday() : 정수로 요일을 반환, 월요일(0), 일요일(6)

# 풀이 2
def getDayName(a,b):
    months = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    days = ['FRI', 'SAT', 'SUN', 'MON', 'TUE', 'WED', 'THU']
    return days[(sum(months[:a-1])+b-1)%7]
    '''
    days[인덱스]
    인덱스 = sum(날짜수) % 7
    날짜수 = 이전달까지 날짜수 + 이번달 날짜수 - 1
    (days 인덱스 0부터 시작하므로 1빼줌)
    '''
