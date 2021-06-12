---
tags:
- git
- git branch
- wiki
name: git

---
# GIT
*******

## Criar uma branch a partir de outra

- Criar uma nova branch `branch_new`a partir da `main` 

```bash
git checkout -b branch_new
```

- Cria uma branch `branch_new_of_new` a partir da `branch_new`:

```bash
git checkout -b branch_new_of_new branch_new
```