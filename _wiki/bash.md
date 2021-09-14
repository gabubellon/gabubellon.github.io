---
name: bash
tags:
- bash
- wiki

---
# BASH
---
## Renomenando todos os arquivos de de uma extensão para letras minusculas

Renomeia todos os arquivos de uma pasta e subpastas para letras minusculas que terminem com uma extensão

```bash
find . -iname "*.ext" -exec rename -d 'y/A-Z/a-z/' * '{}' \;
```

Para instalar o rename execute `sudo apt-get install rename`