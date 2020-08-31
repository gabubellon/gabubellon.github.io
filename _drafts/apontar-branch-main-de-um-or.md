---
title: 'Apontar um fork para a branch principal do repo original '
tags:
- tips&tricks
- github
- git
style: info
color: green
description: Apontar a branch principal de um fork para a branch principal do repo
  de origem
date: 2020-08-31 00:00:00 -0300

---
# Fork

Uma pequena dica quando trabalhar com forks, apontar a sua branch principal para a branch principal do repositório original.

Isso pode ajudar a seu fork a ter sempre a versão atualizada do repositório original e facilitar a atualizações do seu fork

> git remote -v
> git remote add upstream git@github.com:<origin_account>/<origin_account>.gitgit
> remote -v
> git fetch upstreamgit checkout -b tmp
> git branch -D <main_branch>
> git checkout upstream/<main_origin_account> -b <main_branch_my_account>
> git branch -D tmp