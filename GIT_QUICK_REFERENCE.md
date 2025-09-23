# Git Quick Reference

Essential commands to keep day‑to‑day Git work moving quickly.

---

## Setup & Config

- `git config --global user.name "Your Name"`
- `git config --global user.email "you@example.com"`
- `git config --global init.defaultBranch main`
- `git config --global core.editor "code --wait"`
- View config: `git config --list`

## Repository Basics

- Initialize: `git init`
- Clone: `git clone <repo-url>`
- Check remotes: `git remote -v`
- Change remote URL: `git remote set-url origin <repo-url>`

## Status & History

- Working tree status: `git status -sb`
- Compare with upstream: `git log --oneline origin/main..HEAD`
- History (graph view): `git log --oneline --graph --decorate --all`
- Show a file change: `git show HEAD~1 -- path/to/file`

## Branching

- List branches: `git branch --all`
- Create branch: `git checkout -b feature/name`
- Switch branch: `git checkout main`
- Rename branch: `git branch -m old-name new-name`
- Delete local branch: `git branch -d feature/name`

## Staging & Committing

- Stage all: `git add .`
- Stage patch/hunks: `git add -p`
- Unstage file: `git restore --staged path/to/file`
- Commit: `git commit -m "Message"`
- Amend last commit: `git commit --amend`
- Undo last commit (keep changes): `git reset --soft HEAD~1`

## Syncing

- Pull with rebase: `git pull --rebase origin main`
- Push current branch: `git push origin HEAD`
- Set upstream: `git push -u origin feature/name`
- Fetch without merge: `git fetch --all --prune`

## Stash & Clean

- Stash work: `git stash push -m "wip"`
- List stashes: `git stash list`
- Apply latest stash: `git stash apply`
- Drop latest stash: `git stash drop`
- Clean untracked files: `git clean -fd`

## Diff & Restore

- Diff staged vs unstaged: `git diff`
- Diff staged vs HEAD: `git diff --cached`
- Restore file from HEAD: `git restore path/to/file`
- Restore file from another commit: `git restore --source=<commit> path`

## Tags & Releases

- List tags: `git tag --list`
- Create lightweight tag: `git tag v1.0.0`
- Annotated tag: `git tag -a v1.0.0 -m "Release"`
- Push tags: `git push origin --tags`

## Troubleshooting

- Abort merge/rebase: `git merge --abort` / `git rebase --abort`
- Find merge base: `git merge-base branchA branchB`
- Blame for a line: `git blame path/to/file`
- Bisect to find bug: `git bisect start`

Keep this file handy when jumping between projects or repos. For deeper dives, the official docs (`git help <command>`) remain the best reference.

