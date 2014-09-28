#!/bin/bash

# fail if anything errors
set -e
# fail if a function call is missing an argument
set -u


function renderHtml {
    asciidoc -a data-uri --backend slidy2 --attribute stylesheet=`pwd`/sonatype-slides.css -o ../$1.html $1.asciidoc
    echo "Built $1.html"
    
    a2x -k -fpdf $1.asciidoc



}

renderHtml nexus-introduction
renderHtml nexus-oss-advantages
renderHtml nexus-for-component-management
