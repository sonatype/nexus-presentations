#!/bin/bash

set -e 

asciidoc --backend slidy --attribute stylesheet=`pwd`/stylesheets/sonatype-slides.css -o ../nexus-presentation.html src/nexus-presentation.asciidoc
