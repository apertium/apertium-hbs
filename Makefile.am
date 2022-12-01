###############################################################################
## Makefile for apertium-hbs
###############################################################################

VERSION=0.5.0
LANG1=hbs
LANG1a=hbs_BS
LANG1b=hbs_HR
LANG1c=hbs_SR
VAR1=ijek
VAR2=ek
BASENAME=apertium-$(LANG1)
RELEASE=0.5

TARGETS_COMMON = $(LANG1).automorf.bin $(LANG1a).autogen.bin $(LANG1b).autogen.bin $(LANG1c).autogen.bin \
	$(LANG1a).autopgen.bin $(LANG1b).autopgen.bin $(LANG1c).autopgen.bin \
	$(LANG1).automorf.att.gz $(LANG1a).autogen.att.gz $(LANG1b).autogen.att.gz $(LANG1c).autogen.att.gz \
        $(LANG1).rlx.bin

# This include defines goals for install-modes, .deps/.d and .mode files:
@ap_include@

###############################################################################
## Serbo-Croatian transducer
###############################################################################


# TODO: due to the <group> element, we can't use lt-comp --alt --var for these, but are stuck with alt.xsl, should turn all <group --alt="x"> into <e alt="x">

# Generators:
.deps/$(BASENAME).$(LANG1a).dix: $(BASENAME).$(LANG1).metadix .deps/.d
	xsltproc --stringparam alt $(LANG1a) --stringparam var $(VAR1) alt.xsl $(BASENAME).$(LANG1).metadix >$@

$(LANG1a).autogen.bin: .deps/$(BASENAME).$(LANG1a).dix
	apertium-validate-dictionary $< 
	lt-comp rl $< $@

.deps/$(BASENAME).$(LANG1b).dix: $(BASENAME).$(LANG1).metadix .deps/.d
	xsltproc --stringparam alt $(LANG1b) --stringparam var $(VAR1) alt.xsl $(BASENAME).$(LANG1).metadix >$@

$(LANG1b).autogen.bin: .deps/$(BASENAME).$(LANG1b).dix
	apertium-validate-dictionary $<
	lt-comp rl $< $@

.deps/$(BASENAME).$(LANG1c).dix: $(BASENAME).$(LANG1).metadix .deps/.d
	xsltproc --stringparam alt $(LANG1c) --stringparam var $(VAR2) alt.xsl $(BASENAME).$(LANG1).metadix >$@

$(LANG1c).autogen.bin: .deps/$(BASENAME).$(LANG1c).dix
	apertium-validate-dictionary $<
	lt-comp rl $< $@

# Analyser:
.deps/$(BASENAME).$(LANG1).dix: $(BASENAME).$(LANG1).metadix .deps/.d
	xsltproc --stringparam alt $(LANG1) --stringparam var $(VAR1) alt.xsl $(BASENAME).$(LANG1).metadix >$@ 


$(LANG1).automorf.bin: .deps/$(BASENAME).$(LANG1).dix
	apertium-validate-dictionary $<
	lt-comp lr $< $@ $(BASENAME).$(LANG1).acx


# att.gz:
$(LANG1).automorf.att.gz: $(LANG1).automorf.bin
	lt-print $< | gzip -9 -c -n > $@

$(LANG1a).autogen.att.gz: $(LANG1a).autogen.bin
	lt-print $< | gzip -9 -c -n > $@

$(LANG1b).autogen.att.gz: $(LANG1b).autogen.bin
	lt-print $< | gzip -9 -c -n > $@

$(LANG1c).autogen.att.gz: $(LANG1c).autogen.bin
	lt-print $< | gzip -9 -c -n > $@

# Post-gen:
$(LANG1a).autopgen.bin: $(BASENAME).post-$(LANG1).dix .deps/.d
	lt-comp lr --alt $(LANG1a) --var $(VAR1) $< $@ 

$(LANG1b).autopgen.bin: $(BASENAME).post-$(LANG1).dix .deps/.d
	lt-comp lr --alt $(LANG1b) --var $(VAR1) $< $@ 

$(LANG1c).autopgen.bin: $(BASENAME).post-$(LANG1).dix .deps/.d
	lt-comp lr --alt $(LANG1c) --var $(VAR1) $< $@ 


###############################################################################
## Disambiguation rules 
###############################################################################

$(LANG1).rlx.bin: $(BASENAME).$(LANG1).rlx
	cg-comp $< $@

###############################################################################
## Distribution
###############################################################################
EXTRA_DIST=$(BASENAME).$(LANG1).metadix \
	   $(BASENAME).Cyrl-Latn.dix \
	   $(BASENAME).post-$(LANG1).dix  \
	   $(BASENAME).$(LANG1).acx \
	   $(BASENAME).$(LANG1).rlx  \
	   $(LANG1).prob            \
	   alt.xsl \
	   modes.xml

###############################################################################
## Installation stuff
###############################################################################
#
#   apertium_hbs_dir: This is where the compiled binaries go
#   apertium_hbs_srcdir: This is where the source files go

apertium_hbsdir=$(prefix)/share/apertium/$(BASENAME)/
apertium_hbs_srcdir=$(prefix)/share/apertium/$(BASENAME)/

apertium_hbs_DATA=$(TARGETS_COMMON) $(LANG1).prob

pkgconfigdir = $(prefix)/share/pkgconfig
pkgconfig_DATA = $(BASENAME).pc

noinst_DATA=modes/$(LANG1)-morph.mode

install-data-local: install-modes
	test -d $(DESTDIR)$(apertium_hbs_srcdir) || mkdir -p $(DESTDIR)$(apertium_hbs_srcdir)
	$(INSTALL_DATA) $(BASENAME).$(LANG1).metadix $(DESTDIR)$(apertium_hbs_srcdir)
	$(INSTALL_DATA) $(BASENAME).Cyrl-Latn.dix $(DESTDIR)$(apertium_hbs_srcdir)
	$(INSTALL_DATA) $(BASENAME).$(LANG1).rlx $(DESTDIR)$(apertium_hbs_srcdir)
	$(INSTALL_DATA) $(BASENAME).$(LANG1).acx $(DESTDIR)$(apertium_hbs_srcdir)
	$(INSTALL_DATA) $(BASENAME).post-$(LANG1).dix $(DESTDIR)$(apertium_hbs_srcdir)
	$(INSTALL_DATA) alt.xsl $(DESTDIR)$(apertium_hbs_srcdir)

###############################################################################
## Cleanup
###############################################################################

CLEANFILES = $(TARGETS_COMMON)
clean-local:
	-rm -rf .deps modes

test: all
	apertium-regtest test
