#!/bin/bash

generateTemplate() {
        modele=$1
        suffix=$2
	newFile="./files/templates/page.custom-$suffix.liquid"
	sectionName="page-custom-$suffix-template"
	cp -v $modele $newFile
	sed -i s/%s/$sectionName/g $newFile
}

generateSection() {
	modele=$1
	suffix=$2
	newFile="./files/sections/page-custom-$suffix-template.liquid"
	cp -v $modele $newFile
	sed -i s/%s/${suffix^^}/g $newFile
}

if [ -z $1 ]
then
	echo "Execute this script as follows:"
	echo "./copyTemplates templateModele sectionModele"
else
	pageSuffix=('a' 'b' 'c' 'd' 'e' 'f' 'g')
	length=$((${#pageSuffix[@]} - 1))
	templateModele=$1
	sectionModele=$2
	for i in `seq 0 $length`;
	do
		generateSection $sectionModele "${pageSuffix[$i]}"
		generateTemplate $templateModele "${pageSuffix[$i]}"
	done
fi
