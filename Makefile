
SHELL=/bin/bash
BUILD_DIR = build 
METADATA_DIR = .aux 
SRC_DIR = tex 
COMPILER = latexmk
BUILD_CMD =  $(COMPILER) -aux-directory=$(METADATA_DIR) -output-directory=$(BUILD_DIR) -view=pdf -pdf
SOURCES = $$(find ./tex/ -type f -name *.tex)

clean:
	find $(BUILD_DIR) -type f -not -name '*.pdf' -not -name '*.tex' -exec rm {} \;
	find -type f -name tags -exec rm {} \;

clean-all:  clean
	find $(BUILD_DIR) -type f -not -name '*.tex' -exec rm {} \;

watch:
	$(BUILD_CMD) -pvc $(SOURCES)

build:
	$(BUILD_CMD) $(SOURCES)

.PHONY: clean

