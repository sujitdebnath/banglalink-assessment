from datetime import datetime 
from calendar import timegm

def absolute_time_diff(t1, t2):
    dt_format = "%a %d %b %Y %H:%M:%S %z"

    time1 = timegm(datetime.strptime(t1, dt_format).utctimetuple())
    time2 = timegm(datetime.strptime(t2, dt_format).utctimetuple())

    return abs(time1-time2)