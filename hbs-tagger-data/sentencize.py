#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import codecs
import re

sys.stdin = codecs.getreader('utf-8')(sys.stdin)
sys.stdout = codecs.getwriter('utf-8')(sys.stdout)

acorpus={1:[]}

for i in sys.stdin:

	tag = i.strip().split(u'/')

	if len(tag) == 2:
		acorpus[len(acorpus)].append(tag[0][1:])		
	else:
		acorpus[len(acorpus)+1]=[]

for sentence in acorpus:
	for index,token in enumerate(acorpus[sentence]):
		if index == len(acorpus[sentence])-1:
			sys.stdout.write(token+u'\n')
		else:
			sys.stdout.write(token+u' ')
