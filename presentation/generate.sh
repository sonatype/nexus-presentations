#!/bin/bash

set -e 

asciidoc -v -a data-uri --backend slidy2 --attribute stylesheet=`pwd`/sonatype-slides.css -o ../nexus-presentation.html nexus-presentation.asciidoc
