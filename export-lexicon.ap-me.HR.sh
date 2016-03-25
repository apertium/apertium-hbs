#!/bin/bash
grep -v ' lang="sr"' apertium-hbs.hbs.metadix > apertium-hbs.hbs_HR_purist.metadix
xsltproc --stringparam alt hbs_HR_purist --stringparam var ijek alt.xsl apertium-hbs.hbs_HR_purist.metadix > .deps/apertium-hbs.hbs_HR_purist.dix
rm apertium-hbs.hbs_HR_purist.metadix
lt-expand .deps/apertium-hbs.hbs_HR_purist.dix | python export-lexicon.ap-me.py | gzip -c > apertium-hbs.hbs_HR_purist.mte.gz
