#!/bin/bash

docker build --no-cache -t loconox/latexcv . && docker run -v `pwd`:/data loconox/latexcv lualatex /data/cv_jeremie_libeau.tex
