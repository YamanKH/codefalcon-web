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
- Delete remote branch: `git push origin --delete feature/name`
- Reset branch to another branch: `git reset --hard origin/other-branch`
- Force push current branch: `git push origin HEAD --force`
- Track remote branch: `git checkout --track origin/feature/name`

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
- Delete tag: `git tag -d v1.0.0 && git push origin :refs/tags/v1.0.0`

## GitHub/GitLab Operations

- Create PR/MR: `git push origin feature/name && open PR in browser`
- Squash merge: Use GitHub/GitLab UI or `git merge --squash feature/name`
- Compare branches: `git diff main..feature/name`
- View contributors: `git shortlog -sn --no-merges`
- Archive repo: `git archive --format=zip --output=repo.zip HEAD`

## Workflow Commands

- Daily start: `git pull --rebase origin main && git checkout -b feature/name`
- Feature complete: `git checkout main && git pull --rebase && git merge feature/name`
- Hotfix: `git checkout -b hotfix/name main && git commit -m "fix" && git push origin hotfix/name`
- Release: `git tag -a v1.0.0 -m "Release v1.0.0" && git push origin --tags`

## Advanced Operations

- Interactive rebase: `git rebase -i HEAD~3`
- Squash commits: `git rebase -i HEAD~n` then mark as 's' (squash)
- Cherry-pick commit: `git cherry-pick <commit-hash>`
- Create patch: `git format-patch -1 <commit-hash>`
- Apply patch: `git am <patch-file>`

## Reset & Revert

- Soft reset (keep changes): `git reset --soft HEAD~1`
- Mixed reset (unstage changes): `git reset HEAD~1`
- Hard reset (lose changes): `git reset --hard HEAD~1`
- Reset to remote branch: `git reset --hard origin/main`
- Revert commit: `git revert <commit-hash>`

## Submodules

- Add submodule: `git submodule add <repo-url> path/to/submodule`
- Update submodules: `git submodule update --init --recursive`
- Remove submodule: `git submodule deinit -f path/to/submodule && git rm -f path/to/submodule`

## Troubleshooting

- Abort merge/rebase: `git merge --abort` / `git rebase --abort`
- Find merge base: `git merge-base branchA branchB`
- Blame for a line: `git blame path/to/file`
- Bisect to find bug: `git bisect start`
- Fix corrupted repo: `git fsck --full`
- Clean reflog: `git reflog expire --expire=now --all && git gc --prune=now`

Keep this file handy when jumping between projects or repos. For deeper dives, the official docs (`git help <command>`) remain the best reference.

