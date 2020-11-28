---
tags:
- git
- git branch
name: git\branch
published: false

---
# Criando uma branch de outra branch

Cria uma branch a partir da `main` chamada `branch_name`
```bash
git checkout -b branch_name
````

Cria uma branch a partir da `branch_name` chamada `branch_da_branch` 
```bash
git checkout -b branch_name branch_da_branch
```