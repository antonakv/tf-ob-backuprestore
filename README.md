# backup/restore an installation

## Intro

This manual is dedicated to perform Terraform Enterprise instance backup/restore 

Tested on Mac OS X.

## Requirements

- curl recent version installed
[Curl installation manual](https://macappstore.org/curl/)

- git installed
[Git installation manual](https://git-scm.com/download/mac)

## Preparation 
- Clone git repository. 

```bash
git clone https://github.com/antonakv/tf-ob-backup.git
```

Expected command output looks like this:

```bash
Cloning into 'tf-ob-backup'...
remote: Enumerating objects: 12, done.
remote: Counting objects: 100% (12/12), done.
remote: Compressing objects: 100% (12/12), done.
remote: Total 12 (delta 1), reused 3 (delta 0), pack-reused 0
Receiving objects: 100% (12/12), done.
Resolving deltas: 100% (1/1), done.
```

- Change folder to tf-ob-backup

```bash
cd tf-ob-backup
```

