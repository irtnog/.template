#!/bin/sh

# Update `RELENG` with `${nextRelease.version}`.
sed -i -e "s_^\(version:\).*_\1 ${1}_" RELENG

# Use `m2r` to convert automatically produced `.md` docs to `.rst`.
sudo -H pip install m2r
cp *.md docs/
cd docs/
m2r --overwrite *.md

# Change excess `H1` headings to `H2` in converted `CHANGELOG.rst`.
sed -i -e '/^=.*$/s/=/-/g' CHANGELOG.rst
sed -i -e '1,4s/-/=/g' CHANGELOG.rst

# Use for debugging output, when required.
# cat AUTHORS.rst
# cat CHANGELOG.rst

cd ..
