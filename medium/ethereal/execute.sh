# etherealbinarybeast command will be available once the tests are run

orginal=$(which etherealbinarybeast)

if  [ -z $orginal ]; then
    echo "etherealbinarybeast command not found";
    exit 0
fi

sudo cp $orginal ${orginal/etherealbinarybeast/ethereal}