rm -rf src

git clone https://github.com/sliit-foss/npm-catalogue.git src

cd src

commits=$(git log --pretty=format:'%h (%cd) %s' --date=iso)
reversed_commits=$(echo "$commits" | tac)

git checkout --orphan test

git reset --hard

while read -r line; do
    hash=$(echo "$line" | cut -d' ' -f1)
    date="$(echo "$line" | cut -d' ' -f2) $(echo "$line" | cut -d' ' -f3) $(echo "$line" | cut -d' ' -f4)"
    message=$(echo "$line" | cut -d' ' -f5-)
    future_date=$(date -d "$(echo "$date" | sed 's/[()]//g') 13 days")
    git cherry-pick "$hash" -m 1 --strategy=recursive --no-commit -X theirs
    git add .
    git cherry-pick --continue
    GIT_COMMITTER_DATE="$future_date" git commit -m "$message" --allow-empty --date="$future_date"
done <<< "$reversed_commits"