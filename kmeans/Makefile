GHC = ghc
GHC_OPTS = -O2 -threaded -rtsopts

all : kmeans points.bin

kmeans : kmeans.hs KMeansCore.hs
	$(GHC) $(GHC_OPTS) kmeans

GenSamples : GenSamples.hs KMeansCore.hs
	$(GHC) $(GHC_OPTS) GenSamples

points : GenSamples
	./GenSamples 5 50000 100000 1010

points.bin : points

plot : points
	gnuplot -e 'set terminal png; plot "points"' >points.png

view : plot
	@if [ -x "$(command -v xdg-open)" ]; then \
		echo "Launching xdg-open..."; \
		xdg-open points.png; \
	elif [ -x "$(command -v open)" ]; then \
		echo "Launching open..."; \
		open points.png; \
	elif [ -x "$(command -v eog)" ]; then \
		echo "Launching EoG..."; \
		eog points.png; \
	else \
		echo ".PNG launcher not found!"; \
	fi

.PHONY: clean
clean:
	@echo "Cleaning up..."
	@rm -f *.o *.hi kmeans GenSamples clusters params points*
