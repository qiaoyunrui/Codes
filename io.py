#!/usr/bin/python3

path = './data.txt'
f_name = open(path, 'w')
print('Write length:',f_name.write('Hello\n'))
f_name.write('World\n');
f_name.write('HAHAHA\n')
f_name = open(path)

#c_str = f_name.readline(1)
#while c_str:
#    print('read str is:',c_str)
#    c_str = f_name.readline(1)
#f_name.close()

while True:
    line = f_name.readline()
    if not line:
        break
    print('read line is:', line)
f_name.close()

