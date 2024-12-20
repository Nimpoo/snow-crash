# snow-crash

![SnowCrash](assets/SnowCrash.png)

## _SnowCrash_ is a 42 project, and more specially : an `ISO challenge`. It introduces us to the basics of cybersecurity. The goal is to find the flag hidden in the system.

Each level is a user, and we have to search, exploit and escalate privileges to find the flag of the next level. We have to discover all the level user offers to us to beat it.

There is multiple language (`C`, `ASM`, `php`, `perl`, etc...) but the main language is `bash`. It's a good training to better understand this language. And with all of these languages, we have to develop our logic, thinking and knowledge of a system to finish this project.

### It's very fun and interesting to do !

This `README.md` is write after having resolve all the levels with my BRO [Noah](https://github.com/noalexan). For each level documents the steps I took to solve the challenge, the tools I used, and even the mistakes I made. I aim to transcribe my logic, and my research.

# Virtual Machine Setup

The subject give to us a `pdf` file with all rules of the project. And an image disk that we have to run with. Personally, I use `qemu` to run it. But you can use `VirtualBox` or `VMware` if you want.

You can view my script to run the virtual machine [here](assets/run.sh).

Just after that, I can connect to my machine with the following command:

```bash
➜  ~ ssh level00@127.0.0.1 -p 4242
```

And for get the files from the virtual machine, I use `scp`:

```bash
➜  ~ scp -P 4242 level06@127.0.0.1:/home/user/level06/level06.php /Users/mayoub/Desktop
```

# _<u>🚨 SPOILER ZONE 🚨</u>_

## Summary (`level00` to `level09`, we don't do the bonus levels) :

- [`level00`](level00/resources/walkthrough_00.md) : Ceasar cipher
- [`level01`](level01/resources/walkthrough_01.md) : _John the Ripper_
- [`level02`](level02/resources/walkthrough_02.md) : `TCP` packet analysis with **WireShark**
- [`level03`](level03/resources/walkthrough_03.md) : `shell` script injection with `PATH`
- [`level04`](level04/resources/walkthrough_04.md) : `shell` script injection with `uri` parameter
- [`level05`](level05/resources/walkthrough_05.md) : `perl` script exploitation
- [`level06`](level06/resources/walkthrough_06.md) : `regex` manipulation
- [`level07`](level07/resources/walkthrough_07.md) : `environment` variable injection
- [`level08`](level08/resources/walkthrough_08.md) : `binary` exploitation with `symbolic link`
- [`level09`](level09/resources/walkthrough_09.md) : `rot` encryption

<br />

## MADE BY TWO REAL BROS :

<table>
  <tr>
    <td align="center"><a href="https://github.com/noalexan/"><img src="https://avatars.githubusercontent.com/u/102285721?v=4" width="100px;" alt=""/><br /><sub><b>Noah (noalexan)</b></sub></a><br /><a href="https://profile.intra.42.fr/users/noalexan" title="Intra 42"><img src="https://img.shields.io/badge/Nice-FFFFFF?style=plastic&logo=42&logoColor=000000" alt="Intra 42"/></a></td>
    <td align="center"><a href="https://github.com/nimpoo/"><img src="https://avatars.githubusercontent.com/u/91483405?v=4" width="100px;" alt=""/><br /><sub><b>Nimpô (mayoub)</b></sub></a><br /><a href="https://profile.intra.42.fr/users/mayoub" title="Intra 42"><img src="https://img.shields.io/badge/Nice-FFFFFF?style=plastic&logo=42&logoColor=000000" alt="Intra 42"/></a></td>
  </tr>
</table>
