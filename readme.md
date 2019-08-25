# Key features

Commit automatically 10 times per day which causes ultra green commit history.

## Tech

Try to use
<https://www.npmjs.com/package/shelljs>

## Usage

```bash
git init
```

```bash
git clone https://github.com/ovchingus/git-shit-done
```

### Then connect it to GitHub

You’ve now got a local git repository. You can use git locally, like that, if you want. But if you want the thing to have a home on github, do the following.

Go to github.
Log in to your account.
Click the new repository button in the top-right. You’ll have an option there to initialize the repository with a README file, but I don’t.
Click the “Create repository” button.
Now, follow the second set of instructions, “Push an existing repository…”

```bash
git remote add origin git@github.com:username/new_repo
```

```bash
git push -u origin master
```

Actually, the first line of the instructions will say

```bash
git remote add origin https://github.com/username/new_repo
```