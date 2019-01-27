
export PATH=$(echo $PATH | sed --expression "s|:$GOROOT/bin||" --expression "s|$GOROOT/bin||")