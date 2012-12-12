#!/bin/bash

set -e 

mkdir -p target
cp -R stylesheets target/
cp -R javascripts target/
cp -R images target/
asciidoc --backend slidy --attribute theme=sonatype-slides --attribute stylesdir=`pwd`/stylesheets --attribute scriptsdir=`pwd`/javascripts -o target/nexus-presentation.html src/nexus-presentation.asciidoc
rsync -avz src/images target

a2x -v -fpdf -darticle --dblatex-opts=" -P latex.output.revhistory=0" -D target src/nexus-presentation.asciidoc
