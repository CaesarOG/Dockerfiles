import os

from notebook.auth import passwd

# and do it!

with open('./pwd.txt', 'w') as fd:
    fd.writelines(passwd(','))
    fd.close()

# and do it again!

fd = os.open('./pwd.txt', os.O_RDWR)

os.write(fd, str.encode(passwd(',')))
os.close(fd)