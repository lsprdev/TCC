# ModeloTCC (LaTeX) — como compilar

Este projeto usa a classe `abntex2` (ABNT) e gera PDF via `pdflatex`/`bibtex` e (opcionalmente) índice remissivo (`makeindex`).

## Pré‑requisitos (macOS)

Você precisa ter uma distribuição TeX instalada (que forneça `pdflatex`, `bibtex`, `makeindex` e de preferência `latexmk`).

### Opção A (recomendada): MacTeX

1. Instale (via Homebrew):
   - `brew install --cask mactex-no-gui`

2. Garanta que o TeX esteja no `PATH` (MacTeX normalmente usa `/Library/TeX/texbin`). Teste:
   - `pdflatex --version`
   - `latexmk --version`

Se o comando não existir, adicione no seu `~/.zprofile` (ou `~/.zshrc`):

```sh
export PATH="/Library/TeX/texbin:$PATH"
```

Abra um novo terminal e teste novamente.

### Opção B: BasicTeX (mais leve)

1. Instale:
   - `brew install --cask basictex`

2. Adicione o TeX ao `PATH` (igual acima) e depois instale pacotes comuns:

```sh
sudo tlmgr update --self
sudo tlmgr install latexmk abntex2 abntex2cite lmodern microtype lastpage listingsutf8 xcolor graphics
```

Obs.: os nomes exatos dos pacotes podem variar conforme o espelho do TeX Live; se algum falhar, rode o build e instale o pacote indicado na mensagem de erro.

## Compilar

Na raiz do projeto:

```sh
make
```

Isso gera `TCC-IFC.pdf`.

## Limpar artefatos

```sh
make clean
```
