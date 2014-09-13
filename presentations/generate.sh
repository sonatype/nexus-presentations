#!/bin/bash

set -e 

asciidoc -a data-uri --backend slidy2 --attribute stylesheet=`pwd`/sonatype-slides.css -o ../nexus-introduction.html nexus-introduction.asciidoc
echo "Built nexus-introduction.html"

asciidoc -a data-uri --backend slidy2 --attribute stylesheet=`pwd`/sonatype-slides.css -o ../nexus-oss-advantages.html nexus-oss-advantages.asciidoc
echo "Built nexus-oss-advantages.html"

asciidoc -a data-uri --backend slidy2 --attribute stylesheet=`pwd`/sonatype-slides.css -o ../nexus-for-component-management.html nexus-for-component-management.asciidoc
echo "Built nexus-for-component-management.html"
