git config --global alias.clone-gh-org "!f() { cd \$GIT_PREFIX; mkdir -p \$2; cd \$2; curl \"https://api.github.com/orgs/\$1/repos?per_page=1000\" | grep -e 'clone_url*' | cut -d \\\" -f 4 | xargs -L1 git clone ; cd .. ; }; f"