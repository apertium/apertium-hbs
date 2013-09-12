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

TARGETS_COMMON = $(LANG1).automorf.bin $(LANG1a).autogen.bin $(LANG1b).autogen.bin $(LANG1c).autogen.bin \
	$(LANG1a).autopgen.bin $(LANG1b).autopgen.bin $(LANG1c).autopgen.bin \
	$(LANG1).automorf.att.gz $(LANG1a).autogen.att.gz $(LANG1b).autogen.att.gz $(LANG1c).autogen.att.gz \
        $(LANG1).rlx.bin modes

###############################################################################
## Serbo-Croatian transducer
###############################################################################

.deps/$(BASENAME).$(LANG1a).dix: $(BASENAME).$(LANG1).metadix
	if [ ! -d .deps ]; then mkdir .deps; fi
	xsltproc --stringparam alt $(LANG1a) --stringparam var $(VAR1) alt.xsl $(BASENAME).$(LANG1).metadix >$@

$(LANG2a).autogen.bin: .deps/$(BASENAME).$(LANG1a).dix
	apertium-validate-dictionary $(BASENAME).$(LANG1a).dix
	lt-comp rl $(BASENAME).$(LANG1a).dix $@

.deps/$(BASENAME).$(LANG1b).dix: $(BASENAME).$(LANG1).metadix
	if [ ! -d .deps ]; then mkdir .deps; fi
	xsltproc --stringparam alt $(LANG1b) --stringparam var $(VAR1) alt.xsl $(BASENAME).$(LANG1).metadix >$@

$(LANG2b).autogen.bin: .deps/$(BASENAME).$(LANG1b).dix
	apertium-validate-dictionary $(BASENAME).$(LANG1b).dix
	lt-comp rl $(BASENAME).$(LANG1b).dix $@

.deps/$(BASENAME).$(LANG1c).dix: $(BASENAME).$(LANG1).metadix
	if [ ! -d .deps ]; then mkdir .deps; fi
	xsltproc --stringparam alt $(LANG1c) --stringparam var $(VAR2) alt.xsl $(BASENAME).$(LANG1).metadix >$@

$(LANG2c).autogen.bin: .deps/$(BASENAME).$(LANG1c).dix
	apertium-validate-dictionary $(BASENAME).$(LANG1c).dix
	lt-comp rl $(BASENAME).$(LANG1c).dix $@

$(LANG1a).autogen.att.gz: $(LANG1a).autogen.bin
	lt-print $< | gzip -9 -c > $@

$(LANG1b).autogen.att.gz: $(LANG1b).autogen.bin
	lt-print $< | gzip -9 -c > $@

$(LANG1c).autogen.att.gz: $(LANG1c).autogen.bin
	lt-print $< | gzip -9 -c > $@

.deps/$(BASENAME).$(LANG1).dix: $(BASENAME).$(LANG1).metadix
	if [ ! -d .deps ]; then mkdir .deps; fi
	xsltproc --stringparam alt $(LANG1) --stringparam var $(VAR1) alt.xsl $(BASENAME).$(LANG1).metadix >$@ 

$(LANG1).automorf.bin: .deps/$(BASENAME).$(LANG1).dix
	apertium-validate-dictionary $(BASENAME).$(LANG1).dix
	lt-comp lr $(BASENAME).$(LANG1).dix $@ $(BASENAME).$(LANG1).acx

$(LANG1).automorf.att.gz: $(LANG1).automorf.bin
	lt-print $< | gzip -9 -c > $@

$(LANG2a).autopgen.bin: $(BASENAME).post-$(LANG1).dix
	if [ ! -d .deps ]; then mkdir .deps; fi
	xsltproc --stringparam alt $(LANG1a) --stringparam var $(VAR1) alt.xsl $(BASENAME).post-$(LANG1).dix >.deps/post-$(LANG1a).dix
	apertium-validate-dictionary .deps/post-$(LANG1a).dix
	lt-comp lr .deps/post-$(LANG1a).dix $@ 

$(LANG2b).autopgen.bin: $(BASENAME).post-$(LANG1).dix
	if [ ! -d .deps ]; then mkdir .deps; fi
	xsltproc --stringparam alt $(LANG1b) --stringparam var $(VAR1) alt.xsl $(BASENAME).post-$(LANG1).dix >.deps/post-$(LANG1b).dix
	apertium-validate-dictionary .deps/post-$(LANG1b).dix
	lt-comp lr .deps/post-$(LANG1b).dix $@ 

$(LANG2c).autopgen.bin: $(BASENAME).post-$(LANG1).dix
	if [ ! -d .deps ]; then mkdir .deps; fi
	xsltproc --stringparam alt $(LANG1c) --stringparam var $(VAR1) alt.xsl $(BASENAME).post-$(LANG1).dix >.deps/post-$(LANG1c).dix
	apertium-validate-dictionary .deps/post-$(LANG1c).dix
	lt-comp lr .deps/post-$(LANG1c).dix $@ 


###############################################################################
## Disambiguation rules 
###############################################################################

$(LANG1).rlx.bin: $(BASENAME).$(LANG1).rlx
	cg-comp $< $@

###############################################################################
## Installation stuff
###############################################################################
#
#   apertium_hbs_libdir: This is where the compiled binaries go
#   apertium_hbs_srcdir: This is where the source files go

modes: modes.xml
	apertium-gen-modes modes.xml

apertium_hbsdir=$(prefix)/lib/apertium/$(BASENAME)/
apertium_hbs_srcdir=$(prefix)/share/apertium/$(BASENAME)/

apertium_hbs_DATA=$(LANG1).automorf.bin $(LANG1a).autogen.bin $(LANG1b).autogen.bin $(LANG1c).autogen.bin \
		    $(LANG1).automorf.att.gz $(LANG1a).autogen.att.gz $(LANG1b).autogen.att.gz $(LANG1c).autogen.att.gz\
		    $(LANG1).rlx.bin modes

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = $(BASENAME)-$(RELEASE).pc

install-data-local:
	if [ ! -d $(DESTDIR)$(apertium_hbs_srcdir) ]; then mkdir -p $(DESTDIR)$(apertium_hbs_srcdir); fi
	$(INSTALL_DATA) $(BASENAME).$(LANG1).metadix $(DESTDIR)$(apertium_hbs_srcdir)
	$(INSTALL_DATA) $(BASENAME).$(LANG1).rlx $(DESTDIR)$(apertium_hbs_srcdir)

CLEANFILES = -r $(TARGETS_COMMON) .deps/
