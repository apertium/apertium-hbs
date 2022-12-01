#!/bin/bash
grep -v ' lang="hr"' apertium-hbs.hbs.metadix > apertium-hbs.hbs_SR_purist.metadix
xsltproc --stringparam alt hbs_SR_purist --stringparam var ek alt.xsl apertium-hbs.hbs_SR_purist.metadix > .deps/apertium-hbs.hbs_SR_purist.dix
rm apertium-hbs.hbs_SR_purist.metadix
lt-expand .deps/apertium-hbs.hbs_SR_purist.dix | python export-lexicon.ap-me.py3.py | gzip -c > apertium-hbs.hbs_SR_purist.mte.gz
