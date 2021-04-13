---
tags:
- git
- git branch
name: git

---
# Criar uma branch a partir de outra

Cria uma nova branch `branch_new`a partir da `main` 

```bash
git checkout -b branch_new
```

Cria uma branch `branch_new_of_new` a partir da `branch_new`

```bash
git checkout -b branch_new branch_new_of_new
```