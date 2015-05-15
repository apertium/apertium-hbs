TAGGER_SUPERVISED_ITERATIONS=3
BASENAME=apertium-hbs
LANG1=hbs
TAGGER=$(LANG1)-tagger-data

all: $(LANG1).prob

$(LANG1).prob: $(BASENAME).$(LANG1).tsx $(TAGGER)/$(LANG1).dic $(TAGGER)/$(LANG1).untagged $(TAGGER)/$(LANG1).tagged $(TAGGER)/$(LANG1).crp
	apertium-validate-tagger $(BASENAME).$(LANG1).tsx
	apertium-tagger -s $(TAGGER_SUPERVISED_ITERATIONS) \
                           $(TAGGER)/$(LANG1).dic \
                           $(TAGGER)/$(LANG1).crp \
                           $(BASENAME).$(LANG1).tsx \
                           $(LANG1).prob \
                           $(TAGGER)/$(LANG1).tagged \
                           $(TAGGER)/$(LANG1).untagged;

$(TAGGER)/$(LANG1).dic: .deps/$(LANG1).dix $(LANG1).automorf.bin
	@echo "Generating $@";
	@echo "This may take some time. Please, take a cup of coffee and come back later.";
	apertium-validate-dictionary .deps/$(LANG1).dix
	apertium-validate-tagger $(BASENAME).$(LANG1).tsx
	lt-expand .deps/$(LANG1).dix | grep -v "__REGEXP__" | grep -v ":<:" |\
	awk 'BEGIN{FS=":>:|:"}{print $$1 ".";}' | apertium-destxt >$(LANG1).dic.expanded
	@echo "." >>$(LANG1).dic.expanded
	@echo "?" >>$(LANG1).dic.expanded
	@echo ";" >>$(LANG1).dic.expanded
	@echo ":" >>$(LANG1).dic.expanded
	@echo "!" >>$(LANG1).dic.expanded
	@echo "42" >>$(LANG1).dic.expanded
	@echo "," >>$(LANG1).dic.expanded
	@echo "(" >>$(LANG1).dic.expanded
	@echo "\\[" >>$(LANG1).dic.expanded
	@echo ")" >>$(LANG1).dic.expanded
	@echo "\\]" >>$(LANG1).dic.expanded
	@echo "¿" >>$(LANG1).dic.expanded
	@echo "¡" >>$(LANG1).dic.expanded
	lt-proc -a $(LANG1).automorf.bin <$(LANG1).dic.expanded | \
	apertium-filter-ambiguity $(BASENAME).$(LANG1).tsx > $@
#	rm $(LANG1).dic.expanded;

$(TAGGER)/$(LANG1).crp: $(LANG1).automorf.bin $(TAGGER)/$(LANG1).crp.txt
	apertium-destxt < $(TAGGER)/$(LANG1).crp.txt | lt-proc $(LANG1).automorf.bin > $(TAGGER)/$(LANG1).crp

$(TAGGER)/$(LANG1).crp.txt:
	touch $(TAGGER)/$(LANG1).crp.txt


$(TAGGER)/$(LANG1).tagged:
	@echo "Error: File '"$@"' is needed to perform a supervised tagger training" 1>&2
	@echo "This file should exist. It is the result of solving the ambiguity from the '"$(TAGGER1)/$(LANG1).tagged.txt"' file" 1>&2
	exit 1

$(TAGGER)/$(LANG1).untagged: $(TAGGER)/$(LANG1).tagged.txt $(LANG1).automorf.bin
	cat $(TAGGER)/$(LANG1).tagged.txt | apertium-destxt | lt-proc $(LANG1).automorf.bin  > $@; 

clean:
	rm -f $(LANG1).prob