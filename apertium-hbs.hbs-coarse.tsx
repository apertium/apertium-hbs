<?xml version="1.0" encoding="iso-8859-1"?>
<tagger name="serbo-croatian">
<tagset>
<!--
  1750 single tags
  408 multiple tags
-->
  <def-label name="sent" closed="true">
    <tags-item tags="sent"/>
  </def-label>
  <def-label name="ADJECTIVE" closed="false">
    <tags-item tags="adj.*"/>
  </def-label>
  <def-label name="ADVERB" closed="false">
    <tags-item tags="adv"/>
  </def-label>
  <def-label name="ADVERB*" closed="false">
    <tags-item tags="adv.*"/>
  </def-label>
  <def-label name="apos" closed="true">
    <tags-item tags="apos"/>
  </def-label>
  
  <def-label name="DAcnj" closed="true">
    <tags-item lemma="da" tags="cnjsub"/>
  </def-label>
  <def-label name="quote" closed="true">
    <tags-item tags="quote"/>
  </def-label>
  <def-label name="cm" closed="true">
    <tags-item tags="cm"/>
  </def-label>
  <def-label name="cnjcoo" closed="true">
    <tags-item tags="cnjcoo"/>
  </def-label>
  <def-label name="cnjsub" closed="true">
    <tags-item tags="cnjsub"/>
  </def-label>
  <def-label name="guio" closed="true">
    <tags-item tags="guio"/>
  </def-label>
  <def-label name="ij" closed="false">
    <tags-item tags="ij"/>
  </def-label>
  <def-label name="NOUN" closed="false">
    <tags-item tags="n.*"/>
  </def-label>
  <def-label name="PROPER NOUN" closed="false">
    <tags-item tags="np.*"/>
  </def-label>
  <def-label name="part" closed="true">
    <tags-item tags="part"/>
  </def-label>
  <def-label name="PARTICLE" closed="true">
    <tags-item tags="part.*"/>
  </def-label>
  <def-label name="PRONOUN" closed="true">
    <tags-item tags="prn.*"/>
  </def-label>
  <def-label name="TO HAVE" closed="false">
    <tags-item tags="vbhaver.*"/>
  </def-label>
  <def-label name="LEXICAL VERB" closed="false">
    <tags-item tags="vblex.*"/>
  </def-label>  
  <def-label name="MODAL VERB" closed="true">
    <tags-item tags="vbmod.*"/>
  </def-label>
  <def-label name="TO BE" closed="true">
    <tags-item tags="vbser.*"/>
  </def-label>
  <def-label name="num" closed="true">
    <tags-item tags="num"/>
  </def-label>
  <def-label name="abbr" closed="false">
    <tags-item tags="abbr"/>
  </def-label>  
  <def-label name="ABBREVIATION" closed="false">
    <tags-item tags="abbr.*"/>
  </def-label>
  <def-label name="pr.acc" closed="true">
    <tags-item tags="pr.acc"/>
  </def-label>
  <def-label name="pr.dat" closed="true">
    <tags-item tags="pr.dat"/>
  </def-label>
  <def-label name="pr.gen" closed="true">
    <tags-item tags="pr.gen"/>
  </def-label>
  <def-label name="pr.ins" closed="true">
    <tags-item tags="pr.ins"/>
  </def-label>
  <def-label name="pr.loc" closed="true">
    <tags-item tags="pr.loc"/>
  </def-label>
<!-- 
  <def-label name="VOCATIVE" closed="false">
    <tags-item tags="*.voc.*"/>
  </def-label>
  <def-label name="NOMINATIVE" closed="false">
    <tags-item tags="*.nom.*"/>
  </def-label>    RETRAIN FOR COMPARISON PURPOSES and then write coarser tags if nothing happens 

  nouns not taking into account gender and number, but taking into account case
  adjectives the same
  n.*.nom - for all cases; adj as well; pronouns as well? (prn.type.*.case)
  so general rule: ignore (.*.) number and gender - in vb.pp and numerals and pronouns and abbreviations and proper nouns (but leave type) 
  -->
  <def-label name="NUMERAL" closed="true">
    <tags-item tags="num.*"/>
  </def-label>       

  <def-mult name="abbr+adj.*" closed="false">
    <sequence>
      <tags-item tags="abbr"/>
      <tags-item tags="adj.*"/>
    </sequence>
  </def-mult> 
  <def-mult name="n+adj.*" closed="false">
    <sequence>
      <tags-item tags="n.*"/>
      <tags-item tags="adj.*"/>
    </sequence>
  </def-mult> 
  <def-mult name="np.*+adj.*" closed="false">
    <sequence>
      <tags-item tags="np.*"/>
      <tags-item tags="adj.*"/>
    </sequence>
  </def-mult> 
  <def-mult name="part.neg+vbmod.*" closed="false">
    <sequence>
      <tags-item tags="part.neg"/>
      <tags-item tags="vbmod.*"/>
    </sequence>
  </def-mult>
  <def-mult name="part.neg+vbser.*" closed="false">
    <sequence>
      <tags-item tags="part.neg"/>
      <tags-item tags="vbser.*"/>
    </sequence>
  </def-mult>
  <def-mult name="vbhaver.*+vbmod.*" closed="false">
    <sequence>
      <tags-item tags="vbhaver.*"/>
      <tags-item tags="vbmod.*"/>
    </sequence>
  </def-mult>
  <def-mult name="vblex.*+vbmod.*" closed="false">
    <sequence>
      <tags-item tags="vblex.*"/>
      <tags-item tags="vbmod.*"/>
    </sequence>
  </def-mult>
  <def-mult name="vbmod.*+vbmod.*" closed="false">
    <sequence>
      <tags-item tags="vbmod.*"/>
      <tags-item tags="vbmod.*"/>
    </sequence>
  </def-mult>
  <def-mult name="vbser.*+vbmod.*" closed="false">
    <sequence>
      <tags-item tags="vbser.*"/>
      <tags-item tags="vbmod.*"/>
    </sequence>
  </def-mult>
  <def-mult name="pr.loc+n.*.loc" closed="false">
    <sequence>
      <tags-item tags="pr.loc"/>
      <tags-item tags="n.*.loc"/>
    </sequence>
  </def-mult>
<!--  <def-mult name="NOUN+ADJECTIVE" closed="false">
    <sequence>
      <tags-item tags="n.*"/>
      <tags-item tags="adj.*"/>
    </sequence>
  </def-mult> -->  
</tagset>

<!--
<forbid>
  <label-sequence>
    <label-item label="pr"/>
    <label-item label="NOMINATIVE"/>
  </label-sequence>
  <label-sequence>
    <label-item label="pr"/>
    <label-item label="VOCATIVE"/>
  </label-sequence>  
</forbid>
-->
<!--<enforce-rules>
  <enforce-after label="num">
    <label-set>
		<label-item label="NUMERAL"/>
        <label-item label="sent"/>
    </label-set>
  </enforce-after>
  <enforce-after label="num2">
    <label-set>
		<label-item label="NUMERAL"/>
        <label-item label="cm"/>
    </label-set>
  </enforce-after>
</enforce-rules>
-->
<!--<preferences>
  <prefer tags="n.*.nom"/>
  <prefer tags="adj.*.nom.*"/>
</preferences>-->

</tagger>
