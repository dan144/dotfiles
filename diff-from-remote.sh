#!/bin/bash
# See which local branches are different than their origin counterparts

if [ -z ${1} ]; then
  echo "Need a branch"
  exit 1
fi

for branch in "$@"; do
  if [ `git branch -a | grep "^. $branch$" | grep -v "remotes" | wc -l` -ne 1 ]; then
    echo "No local branch $branch"
    continue
  fi
  if [ `git branch -a | grep "^. remotes/origin/$branch$" | wc -l` -ne 1 ]; then
    echo "No remote branch $branch"
    continue
  fi

  git rev-list $branch > branch-rev-list
  git rev-list origin/$branch > rbranch-rev-list
  if [ `diff branch-rev-list rbranch-rev-list | wc -l` -eq 0 ]; then
    echo "No difference on branch $branch"
  else
    echo $branch
    diff branch-rev-list rbranch-rev-list
  fi
  rm -f branch-rev-list rbranch-rev-list
done
