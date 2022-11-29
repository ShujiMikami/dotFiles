$latex='platex -kanji=utf8 -guess-input-enc -synctex=1 -interaction=nonstopmode -halt-on-error %S';
$latex_silent='platex -kanji=utf8 -guess-input-enc -synctex=1 -interaction=batchmode -halt-on-error %S';
$dvipdf='dvipdfmx -f ptex-ipaex.map %S';
$bibtex='pbibtex -kanji=utf8 %B';
