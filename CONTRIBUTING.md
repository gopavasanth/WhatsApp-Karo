# Contributing to WhatsApp-Karo💕

Thank you for your interest in contributing to WhatsApp-Karo! We welcome contributions from the community to help improve and grow this project.

## Contribution Rules📚:

- You are allowed to make pull requests. Just make sure it adds some value to the project.
- Do NOT remove other content unless its necessary.
- Styling/code should follow community standards (eg. Proper Code Formatting).
- A PR can be Big or Small. Don't be afraid to open a PR, you will always get help :)


## Getting Started 🤩🤗:

- Fork this repo (button on top)

- Clone on your local machine

```sh
git clone https://github.com/<yourusername>/WhatsApp-Karo.git
```
- Navigate to project directory.

```sh
cd WhatsApp-Karo
```
## For PR Request 
- Create a new Branch

```sh
git checkout -b "< your_new_branch_name >"
```
*your branch name should follow some naming convention* : `issue_name/changes`

- Add your changes to your branch

```sh
git add .
```
- Commit your changes with some `Relevent Messages`.

```sh
git commit -m "Relevant message"
```
- Then push 
```sh
git push origin my-new-branch
```

- Create a new pull request from your forked repository

<br>

## Avoid Conflicts {Syncing your fork}

- An easy way to avoid conflicts is to add an 'upstream' for your git repo, as other PR's may be merged while you're working on your branch/fork.   

```sh
git remote add upstream 
```

- You can verify that the new remote has been added by typing
```sh
git remote -v
```

- To pull any new changes from your parent repo simply run
```sh
git merge upstream/master
```

This will give you any eventual conflicts and allow you to easily solve them in your repo. It's a good idea to use it frequently in between your own commits to make sure that your repo is up to date with its parent.



## Setup Guide

This app is written in Flutter. Even though Flutter is cross-platform, This app is currently focused on Android or iOS. So in order to setup and run the project locally, you need to have an emulator(android or iOS) or a real device and flutter installed locally.

After making a clone of this project, running this project is as simple as:

```sh
$ cd WhatsApp-Karo

$ flutter pub get

$ flutter run
```

Note: If you are contributing for any specific issue, make sure to reference the issue in your PR so that we can help with additional information.
