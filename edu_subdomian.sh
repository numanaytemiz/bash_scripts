#!/bin/bash
# Kendisine verileb edu.tr uzantılı web sitesi indexinden
# o siteye ait olan subdomain'lerin ip adreslerini bulan script

if [ $# = 1 ]; then
   wget $1
   grep "href=" index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep "edu" | sort -u > list.txt
   for url in $(cat list.txt); do host $url; done | grep "has address" | cut -d " " -f 4 | sort -u
   rm index.html
   rm list.txt
else 
   echo "ornek kullanim asagidaki gibi olmalidir : "
   echo "./edu_subdomain.sh sau.edu.tr"
fi
