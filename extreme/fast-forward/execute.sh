rm -rf src

git clone https://github.com/sliit-foss/npm-catalogue.git src

cd src

commits=$(git log --pretty=format:'%h (%cd) %s~%cn~%ce~%an~%ae' --date=iso)
reversed_commits=$(echo "$commits" | tac)

git checkout --orphan test

git reset --hard

while read -r line; do
    hash=$(echo "$line" | cut -d' ' -f1)
    date="$(echo "$line" | cut -d' ' -f2) $(echo "$line" | cut -d' ' -f3) $(echo "$line" | cut -d' ' -f4)"
    info=$(echo "$line" | cut -d' ' -f5-)
    message=$(echo "$info" | cut -d'~' -f1)
    future_date=$(date -d "$(echo "$date" | sed 's/[()]//g') 13 days")
    git cherry-pick "$hash" -m 1 --strategy=recursive --no-commit -X theirs
    git add .
    git cherry-pick --continue || true

    git config user.email "$(echo "$info" | cut -d'~' -f3)"
    git config user.name "$(echo "$info" | cut -d'~' -f2)"

    GIT_COMMITTER_DATE="$future_date" git commit -m "$message" --allow-empty --date="$future_date" --author="$(echo "$info" | cut -d'~' -f4) <$(echo "$info" | cut -d'~' -f5)>"
done <<< "$reversed_commits"