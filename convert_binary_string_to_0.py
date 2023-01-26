#!/usr/bin/python3
import time

'''
to find n-1 of binary number,
Eg: 111 [7], 110[6]; 100[4], 011[3]
Step 1. if last number is 1, change it to 0 and break
Step 2. else chnage 0 to 1
'''
def odd(s):
    l=list(s)
    for i in range(len(s)-1,0,-1):
        if l[i] == '1':
            l[i] = '0'
            break
        else:
            l[i]='1'
    return "".join(l)

s='111'
i=len(s)-1
count=0

while i > 0:
    if s[i] == '1':
        count+=1
        res = odd(s)
        s=res
        print("s[i] == 1",s[:i])
        continue
    else:
        '''
        if you need to divide given binary by 2, just remove last binary digit.
        Eg: 11110[30], 1111[15] --> Last Digit is removed
        '''
        count+=1
        i -= 1
        print("s[i] == 0",s[:i])
    #time.sleep(1)
print(count)
