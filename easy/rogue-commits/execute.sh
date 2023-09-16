rm -rf src

git clone https://github.com/sliit-foss/bashaway-ui.git src

# Write your code here

cd src

git filter-branch --env-filter '
    if [ "$GIT_AUTHOR_NAME" = "github-actions[bot]" ];
    then
        GIT_COMMITTER_NAME="github-actions";
        GIT_AUTHOR_NAME="github-actions";
    fi' -- --all