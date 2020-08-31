---
title: Apontar uma branch de um fork para a branch principal do repo original
tags:
- tips&tricks
- github
- git
style: fill
color: info
description: Como manter seu fork sempre com um brach atualizada com o repo original.
date: 2020-08-31T00:00:00.000-03:00
tagsx: []

---
# Fork

Uma pequena dica para quando trabalhar com forks é apontar a sua branch principal (ou qualquer outra) para a branch principal do repositório original.

Isso ajuda a manter seu fork a ter sempre a versão atualizada do repositório original e facilitar a atualizações do seu fork.

> git remote -v
> git remote add upstream git@github.com:<origin_account>/<origin_account>.git
>
> git remote -v git fetch upstream
>
> git checkout -b tmp
> git branch -D <main_branch>
> git checkout upstream/<main_origin_account> -b <main_branch_my_account>
> git branch -D tmp