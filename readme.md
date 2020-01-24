# Git Shit Done

[![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)
![GitHub tag (latest by date)](https://img.shields.io/github/v/release/ovchingus/git-shit-done)


### What the hell

Want to find work, but employeer don`t take you seriously? There is the easy solution: just make yourself 10x developer for previous 10 years!

### Usage

For use that cheat easily you it`s better to add SSH key for account.
[How to](https://help.github.com/en/enterprise/2.16/user/articles/adding-a-new-ssh-key-to-your-github-account)

When SSH is configured do next:
```bash
git clone https://github.com/ovchingus/git-shit-done

cd ./git-shit-done/
```

### Options
Run script with args:
 * -d Number of days in past become green)
 * -p Path to script working directory, only for runtime. Any non-git folder
 * -r Your GitHub repository to push commits, it may be private, so noone will see our falsy coommits)  

### Example: 

```
./script.sh -d 100 -p ~ -r git@github.com:yourNickname/repoName.git
```