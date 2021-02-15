#!/usr/bin/env zsh

commit=$1

# Iterate over the branches
git branch -v --no-abbrev | tr "*" " " | while read l; do
    #Get hash of this branches commit
    c=$(echo $l | awk '{print $2}') 

    # If the commit matches, checkout the branch
    if [[ $c = $commit ]]; then
        branch=$(echo $l | awk '{print $1}')
        echo "Found matching branch $branch"
        git checkout $branch
        return 0
    fi
done

# If we didn't find anything, just checkout the commit
git checkout $commit
