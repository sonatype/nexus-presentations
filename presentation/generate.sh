#!/bin/bash

set -e 

asciidoc --backend slidy --attribute stylesheet=`pwd`/sonatype-slides.css -o ../nexus-presentation.html nexus-presentation.asciidoc
