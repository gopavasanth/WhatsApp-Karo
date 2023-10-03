
# Contribution Rules📚:

- You are allowed to make pull requests. We just merge it ;)
- Do NOT remove other content.
- Styling/code can be pretty, ugly or stupid, big or small as long as it works
- Try to keep pull requests small to minimize merge conflicts


## Getting Started 🤩🤗:

- Fork this repo (button on top)

- Clone on your local machine

```terminal
git clone https://github.com/<yourusername>/WhatsApp-Karo.git
```
- Navigate to project directory.

```terminal
cd WhatsApp-Karo
```
## For PR Request 
- Create a new Branch

```markdown
git checkout -b "< your_new_branch_name >"
```
*your branch name should follow some naming convention* : `issue_name/changes`

- Add your changes to your branch

```markdown
git add .
```
- Commit your changes.

```markdown
git commit -m "Relevant message"
```
- Then push 
```markdown
git push origin my-new-branch
```


- Create a new pull request from your forked repository

<br>

## Avoid Conflicts {Syncing your fork}

- An easy way to avoid conflicts is to add an 'upstream' for your git repo, as other PR's may be merged while you're working on your branch/fork.   

```terminal
git remote add upstream 
```

- You can verify that the new remote has been added by typing
```terminal
git remote -v
```

- To pull any new changes from your parent repo simply run
```terminal
git merge upstream/master
```

This will give you any eventual conflicts and allow you to easily solve them in your repo. It's a good idea to use it frequently in between your own commits to make sure that your repo is up to date with its parent.
