#! /bin/bash

# Convert all *.py* files in the project using python-modernize

set -o nounset -o pipefail -o errexit

echo "Convert all python files (y) or just display required changes (n)?"
select do_convert in "y" "n";
do
	if [ $do_convert == "y" ]; then 
		for pyfile in `find . -name '*.py'`
		do
			python-modernize -w $pyfile
		done
		for pyfile in `find . -name '*.pyx'`
		do
			python-modernize -w $pyfile
		done
	else
		for pyfile in `find . -name '*.py'`
		do
			python-modernize -w $pyfile
		done
		for pyfile in `find . -name '*.pyx'`
		do
			python-modernize $pyfile
		done
	fi
break;
done
