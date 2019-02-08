PLANT_OUTDIR = instance
PLANT_SRCS = $(wildcard *.plantuml)
PLANT_IMGS = $(patsubst %.plantuml,$(PLANT_OUTDIR)/%.svg,$(PLANT_SRCS))

.PHONY: help
help:  ## Prints this help menu
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: serve
serve: presentation.rst fonts $(PLANT_IMGS)  ## Serve the hovercraft presentation in development mode
	poetry run hovercraft presentation.rst

.PHONY: build
build: presentation  ## Build the static presentation

.PHONY: plantuml
plantuml: $(PLANT_IMGS)  ## Build the plantuml diagrams

# Build the static presentation
presentation: presentation.rst fonts $(PLANT_IMGS)
	poetry run hovercraft $< $@

## Download the Fira font
fonts:
	wget -O $@.zip https://github.com/mozilla/Fira/archive/4.202.zip
	unzip -d $@ $@.zip
	rm $@.zip

# Generic target for plantuml->svg
$(PLANT_OUTDIR)/%.svg: %.plantuml
	plantuml -tsvg -o $(PLANT_OUTDIR) $<

.PHONY: clean
clean:
	-rm -r presentation
	-rm -r fonts
