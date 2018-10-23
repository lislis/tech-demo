if ! [ -x "$(command -v hugo)" ]; then
    echo 'Error: hugo is not installed.'
    echo 'You can download a binary from https://github.com/gohugoio/hugo/releases'
    exit 1
fi

echo 'Initial build.'
hugo

echo 'Starting serverx'
hugo server
