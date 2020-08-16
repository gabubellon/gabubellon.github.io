---
title: Combinando o virtualenvwarpper com o pyenv 
tags: [pyenv,python,virtualenv,code,virtualenvwarpper]
style: fill
color: dark
description: Como configurar e utilizar o virtualenvwarpper junto com pyenv para ambientes virtuais.
date: 2020-01-10
---

## virtualenvwarpper e pyenv

O virtualenvwarpper é um plugin que que cria alguns a facilitadores e atalhos para utilizar ambientes virtuais com o python. Mais detalhes na documentação oficial: <https://virtualenvwrapper.readthedocs.io/en/latest/command_ref.html>.

Combinando o mesmo com o pyenv temos o _pyenv-virtualenvwrapper_, um plugin do pyenv que permite criar ambientes virtuais de forma rápida e prática utilizando todas as versões de python gerenciadas pelo pyenv.

> **Para Ler na antes:** [Instalando e utilizando o pyenv]({% post_url 2020-01-01-pyenv %})

## Instalando pyenv-virtualenvwrapper

A instalação é realizada seguindo as recomendações do repositório oficial <https://github.com/pyenv/pyenv-virtualenvwrapper>

As versões de python `global` do pyenv precisam ter o `virtualenvwrapper` instalados:

```bash
#pip e pip3 caso tenha python2.7 e python3 simultaneamente.
pip install setuptools
pip install virtualenvwrapper
pip3 install setuptools
pip3 install virtualenvwrapper
```

Instalando o _pyenv-virtualenvwrapper_:

```bash
#$(pyenv root) é o a variável do pyenv que indica onde o mesmo está instalado.
git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git $(pyenv root)/plugins/pyenv-virtualenvwrapper
```

on :

```bash
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

É necessário modificar o arquivo de configuração de seu interpretador de comandas (.bashrc para o bash ou .zshrc para zsh/ohmyzsh) e adicionar algumas linhas antes e depois as configurações do pyenv

Adicionar antes:

```bash
#Configurações do virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs #virtualenvs folder
source $HOME/.local/bin/virtualenvwrapper.sh #virtualenvwrapper script location
```

Adicionar depois:

```bash
#deixar explicito para o pyenv o uso do virtualenvwrapper
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
```

No final terá algo similar a:

```bash
#Configurações do virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs #virtualenvs folder
source $HOME/.local/bin/virtualenvwrapper.sh #virtualenvwrapper script location

#Bloco do pyenv já existente no arquivo
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#deixar explicito para o pyenv o uso do virtualenvwrapper
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
```

### Exemplo de uso pyenv-virtualenvwrapper

No exemplo a seguir estamos configurando a versão global do python para a `miniconda3-latest`, após isso é criado um virutalenv com o virtualenvwrapper (`test_conda`).

Voltamos a versão global do python para a `system e 3.7.4`, acessamos o virtualenv criado (`test_conda`) e verificamos que o mesmo foi criado utilizando o python da instalação do `miniconda3-latest`

Um novo virtualenv é criado (`test_2.7`) e ativado, validando que o mesmo utilizou a versão de python configurada como padrão (`system`)

```bash
$ pyenv global
> system
> 3.7.4
>
$ pyenv global miniconda3-latest
$ (miniconda3-latest)
$ python
> Python 3.7.4 (default, Aug 13 2019, 15:17:50)
> [Clang 4.0.1 (tags/RELEASE_401/final)] :: Anaconda, Inc. on darwin
> Type "help", "copyright", "credits" or "license" for more information.
> >>> exit()
>
$ (miniconda3-latest)
$ mkvirtualenv test_conda
> WARNING: the pyenv script is deprecated in favour of `python3.7 -m venv`
> (miniconda3-latest)
> $ pyenv global system 3.7.4
>
$ workon test_conda
> (test_conda)
$ python
> Python 3.7.4 (default, Aug 13 2019, 15:17:50)
> [Clang 4.0.1 (tags/RELEASE_401/final)] :: Anaconda, Inc. on darwin
> Type "help", "copyright", "credits" or "license" for more information.
> >>> exit()
> (test_conda)
$ deactivate
>
$ python
> WARNING: Python 2.7 is not recommended.
> This version is included in macOS for compatibility with legacy software.
> Future versions of macOS will not include Python 2.7.
> Instead, it is recommended that you transition to using 'python3' from within Terminal.
>
> Python 2.7.16 (default, Dec 13 2019, 18:00:32)
> [GCC 4.2.1 Compatible Apple LLVM 11.0.0 (clang-1100.0.32.4) (-macos10.15-objc-s on darwin
> Type "help", "copyright", "credits" or "license" for more information.
> >>> exit()
>
$ mkvirtualenv test_2.7
> New python executable in /Users/gabriel.bellon/.virtualenvs/test_2.7/bin/python
> Installing setuptools, pip, wheel...
> done.
> virtualenvwrapper.user_scripts creating /Users/gabriel.bellon/.virtualenvs/test_2.7/bin/predeactivate
> virtualenvwrapper.user_scripts creating /Users/gabriel.bellon/.virtualenvs/test_2.7/bin/postdeactivate
> virtualenvwrapper.user_scripts creating /Users/gabriel.bellon/.virtualenvs/test_2.7/bin/preactivate
> virtualenvwrapper.user_scripts creating /Users/gabriel.bellon/.virtualenvs/test_2.7/bin/postactivate
> virtualenvwrapper.user_scripts creating /Users/gabriel.bellon/.virtualenvs/test_2.7/bin/get_env_details
> (test_2.7)
> $ python
> WARNING: Python 2.7 is not recommended.
> This version is included in macOS for compatibility with legacy software.
> Future versions of macOS will not include Python 2.7.
> Instead, it is recommended that you transition to using 'python3' from within Terminal.
>
> Python 2.7.16 (default, Dec 13 2019, 18:00:32)
> [GCC 4.2.1 Compatible Apple LLVM 11.0.0 (clang-1100.0.32.4) (-macos10.15-objc-s on darwin
> Type "help", "copyright", "credits" or "license" for more information.
> >>> exit()
> (test_2.7)
$ deactivate
>
$ pyenv global
> system
> 3.7.4
```

Uma vez com a configurações criadas é testada, agora fica prático realizar o gerenciamento de múltiplos projetos python com diferentes versões.
Com o uso do _pyenv_ e do _pyenv-virtualenvwrapper_ criar combinações de instalações e ambientes virtuais padrões para qualquer situação de projeto.
