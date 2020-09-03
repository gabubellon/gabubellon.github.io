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

Uma pequena dica para quando trabalhar com forks de repositórios e apontar **branch principal do seu fork** (ou qualquer outra) para a **branch principal do repositório original.**

Isso ajuda a manter seu código no fork sempre na versão mais atualizada do repositório original, permitindo que suas customizações e merges sejam mais práticos

Após realizar o [fork](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo) de um repositório e o [clone](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository) para sua máquina local, você pode executar em um terminal o comando `git remote -v`, o mesmo ira retornar para quais remotes o repositório está apontando.

Inicialmente temos apenas o remote do nosso fork:

```bash
$ git remote -v
> origin	git@github.com:<your_git_account>/<repo>.git (fetch)
> origin	git@github.com:<your_git_account>/<repo>.git (push)
```

Com o comando `git remote add` podemos incluir um novo remote, no caso vamos adicionar o repositório original, mas poderiamos adicionar qualquer outro fork, ou apontas para nosso fork para vários serviços git ao mesmo tempo.
Ao executarmos a adição e na sequência um `git remote -v` agora vemos que o nosso fork tem mais de um remote configurado.

```bash
$ git remote add upstream git@github.com:<origin_account>/<repo>.git
$ git remote -v
> origin	git@github.com:<your_git_account>/<repo>.git (fetch)
> origin	git@github.com:<your_git_account>/<repo>.git (push)
> upstream	git@github.com:<original_git_account>/<repo>.git (fetch)
> upstream	git@github.com:<original_git_account>/<repo>.git (push) 
```

Executamos um `fetch` para trazer todas as branchs de todos os remotes para nosso fork

```bash
git fetch upstream
```

Agora podemos apontar a branch principal do nosso fork para o repositório original. Primeiro criamos uma branch temporária e movemos para ela:

```bash
git checkout -b tmp
```

Na sequência apagamos a **_branch principal do nosso fork:_**

```bash
git branch -D <main_branch_fork>
```

Logo após **_criamos_** novamente uma branch com o mesmo nome no nosso fork, mas apontando para a branch principal do repositório original:

```bash
git checkout upstream/<main_origin_repo> -b <main_branch_fork>
```

Pra finalizar excluimos a branch temporária

```bash
git branch -D tmp
```

Ou se preferir apenas criar uma nova branch no seu fork, mantendo a sua principal, basta criar uma nova branch:

```bash
git checkout upstream/<main_origin_repo> -b <new_branch_name>
```

Com isso agora podemos sempre executar um `git pull <new_branch_name> ou <new_branch_name>` e teremos em nosso fork o código do repositório original atualizado.

Para mais detalhes a [documentação](https://docs.github.com/pt/github/collaborating-with-issues-and-pull-requests/configuring-a-remote-for-a-fork) do GitHub pode ajudar.