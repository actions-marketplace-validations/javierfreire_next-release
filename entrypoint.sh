#!/bin/sh

args="-p $1"

for Line in $2
do
  if [ "$Line" != '.' ]; then
    args="$args -P $Line"
  fi
done

current_version=$(convco version $args)
next_version=$(convco version $args -b)
changelog=$(convco changelog $args -m 1 | tail -n +5)

echo "current-version=$current_version" >> $GITHUB_OUTPUT
echo "current-version-tag=$1$current_version" >> $GITHUB_OUTPUT
echo "next-version=$next_version" >> $GITHUB_OUTPUT
echo "next-version-tag=$1$next_version" >> $GITHUB_OUTPUT
echo "changelog<<EOF" >> $GITHUB_OUTPUT
echo "$changelog" >> $GITHUB_OUTPUT
echo "EOF" >> $GITHUB_OUTPUT
