#!/bin/bash

docker build --build-arg DATE=$(date +%Y) -t loconox/latexcv . && docker run -v `pwd`:/data loconox/latexcv lualatex /data/cv_jeremie_libeau.tex
