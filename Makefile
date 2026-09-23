all: image cv_jeremie_libeau_en.pdf cv_jeremie_libeau_fr.pdf

cv_jeremie_libeau_en.pdf:
	docker run -v `pwd`:/data --user 1000:1000 loconox/latexcv lualatex /data/cv_jeremie_libeau_en.tex

cv_jeremie_libeau_fr.pdf:
	docker run -v `pwd`:/data --user 1000:1000 loconox/latexcv lualatex /data/cv_jeremie_libeau_fr.tex

image:
	docker build -t loconox/latexcv .

clean:
	rm -f *.aux *.log *.out cv_jeremie_libeau_en.pdf cv_jeremie_libeau_fr.pdf