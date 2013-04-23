#!/bin/bash -x
LASTTAG=$(git describe --tags $(git rev-list --tags --max-count=1))

DATETIME=$(date -Ru)

AUTHORS=$(git log --format='%aN' | sort -u | python -c "import sys; print ', '.join(line.strip() for line in sys.stdin.readlines())")

MAJOR="0" # This is incremented manually.
MINOR=$(git tag | wc -l) # Number of tags is the minor release
PATCH=$(git log --oneline $LASTTAG..HEAD | wc -l) # Commits since the tagged release

cp SPECIFICATION.markdown temp.markdown
sed --in-place --expression="s/{datetimestamp}/$DATETIME/" temp.markdown
sed --in-place --expression="s/{major}/$MAJOR/" temp.markdown
sed --in-place --expression="s/{minor}/$MINOR/" temp.markdown
sed --in-place --expression="s/{patch}/$PATCH/" temp.markdown
sed --in-place --expression="s/{authors}/$AUTHORS/" temp.markdown

pandoc temp.markdown -t plain -o SPECIFICATION
pandoc temp.markdown -t html5 -o SPECIFICATION.html
pandoc temp.markdown -o SPECIFICATION.pdf

rm temp.markdown
