from datetime import datetime 
from calendar import timegm

def absolute_time_diff(t1, t2):
    dt_format = "%a %d %b %Y %H:%M:%S %z"

    time1 = timegm(datetime.strptime(t1, dt_format).utctimetuple())
    time2 = timegm(datetime.strptime(t2, dt_format).utctimetuple())

    return abs(time1-time2)

if __name__ == "__main__":
    test_case = int(input())

    for case in range(test_case):
        time1 = input()
        time2 = input()
        
        print(absolute_time_diff(time1, time2))