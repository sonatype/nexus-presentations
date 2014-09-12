#!/bin/bash

set -e 

asciidoc -v -a data-uri --backend slidy2 --attribute stylesheet=`pwd`/sonatype-slides.css -o ../nexus-introduction.html nexus-introduction.asciidoc

#asciidoc -v -a data-uri --backend slidy2 --attribute stylesheet=`pwd`/sonatype-slides.css -o ../nexus-oss-advantages.html nexus-oss-advantages.asciidoc

#asciidoc -v -a data-uri --backend slidy2 --attribute stylesheet=`pwd`/sonatype-slides.css -o ../nexus-for-component-management.html nexus-for-component-management.asciidoc
