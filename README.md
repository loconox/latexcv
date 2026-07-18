# CV Jérémie Libeau

Sources LaTeX de mon CV, en français et en anglais.

Basé sur le template sidebar de [jankapunkt/latexcv](https://github.com/jankapunkt/latexcv).

## PDFs

Les versions à jour sont publiées automatiquement sur la [release `latest`](../../releases/tag/latest) :

- `cv_jeremie_libeau_en.pdf` — English version
- `cv_jeremie_libeau_fr.pdf` — version française

## Build

Via Docker + Make :

```bash
make all
```

Produit `cv_jeremie_libeau_en.pdf` et `cv_jeremie_libeau_fr.pdf`.

En local (nécessite `lualatex` et les paquets listés dans le [Dockerfile](Dockerfile)) :

```bash
lualatex cv_jeremie_libeau_en.tex
lualatex cv_jeremie_libeau_fr.tex
```

## CI

Le workflow [`build.yml`](.github/workflows/build.yml) compile les deux CV à chaque push sur `master`, uploade les PDFs en artifacts et met à jour la release `latest`.

## Fonts

La police Font Awesome Solid (`fonts/fa-solid-900.otf`) est incluse. Certaines glyphes utilisées peuvent provenir de la version Pro — vérifier la licence avant réutilisation.
