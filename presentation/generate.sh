#!/bin/bash

set -e 

mkdir -p target
cp -R stylesheets target/
cp -R images target/
asciidoc --backend slidy --attribute stylesheet=`pwd`/stylesheets/sonatype-slides.css -o target/nexus-presentation.html src/nexus-presentation.asciidoc
rsync -avz src/images target

cp target/nexus-presentation.html ..