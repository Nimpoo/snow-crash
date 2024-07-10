# level01
_Okay, let's do the ritual._
- `pwd`: `/home/user/level01`
- `id`: `uid=2001(level01) gid=2001(level01) groups=2001(level01),100(users)`
- `ls -la`: nothing
- `find / -user flag01 2> /dev/null`: nothing

_Mmmh, nothing interesting... Maybe the `flag01` user has some useful information ?_

```sh
level01@SnowCrash:~$ cat /etc/passwd
...
flag00:x:3000:3000::/home/flag/flag00:/bin/bash
flag01:42hDRfypTqqnw:3001:3001::/home/flag/flag01:/bin/bash
...
level01@SnowCrash:~
```

- The user `flag01` has not `x` for his password for log in, let's try to log in with this string :
```sh
level01@SnowCrash:~$ su flag01
Password:
su: Authentication failure
level01@SnowCrash:~$
```
No, it's not the right password, and nothing concluded when trying to decode with the Caesar Cipher.
In [this site](https://www.boxentriq.com/code-breaking/cipher-identifier), it's impossible to know what is the cipher type. So it's probably an hashing algorithme who encrypt the real password for `flag01`.
I try so many hash cracker and no one works correctly : either it is not decoded, otherwise I obtain an inconsistent character string with non-printable characters.

### AND I FOUND JOHN THE RIPPER
`- John the Ripper` is an open source password cracker. He supporte hundreds hash and cipher type using the `brute force` methode. Let's try it :
```sh
$ echo 42hDRfypTqqnw > code
$ john --show code > cracked_code
$ cat cracked_code
?:abcdefg

1 password hash cracked, 0 left
$
```
- Okay, we have the password `abcdefg`, I guess ? Let's try to login :
```sh
level01@SnowCrash:~$ su flag01
Password:
Don't forget to launch getflag !
flag01@SnowCrash:~$
```
#### Success !
- Let's get the flag :
```sh
flag01@SnowCrash:~$ getflag
Check flag.Here is your token : f2av5il02puano7naaf6adaaf
flag01@SnowCrash:~$
```
- Login at `level02` :
```sh
flag01@SnowCrash:~$ su level02
Password:
level02@SnowCrash:~$
```

# level01 complet !
![YEAH](../../assets/yeah.gif)
