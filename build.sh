#!/bin/bash

image_build () {
    tags=""
    for repo in $repos; do
        if [ ! -z "$tags" ]; then
            tags="$tags -t $repo/$BUILD_NAME:$BUILD_TAG"
        else
            tags="$repo/$BUILD_NAME:$BUILD_TAG"
        fi
        if [ "$latest" == "true" ]; then
            tags="$tags -t $repo/$BUILD_NAME:latest"
        fi
    done
    docker build \
    --build-arg TAG=$BUILD_TAG \
    -t $tags .
}

image_push() {
    if [ "$push" == "true" ]; then
        for repo in $repos; do
            echo "$repo"
            tag=$repo/$BUILD_NAME:$BUILD_TAG
            if [ "$latest" == "true" ]; then
                docker push $tag
            fi
            if [ "$latest" == "true" ]; then
                tag=$repo/$BUILD_NAME:latest
                docker push $tag
            fi
        done
    fi
}

if [ -f ./src/build-env ]; then
    source ./src/build-env 
    repos=$(echo "$BUILD_REPO" | sed 's/,/ /g')
    latest=$(tr '[:upper:]' '[:lower:]' <<<$BUILD_LATEST)
    push=$(tr '[:upper:]' '[:lower:]' <<<$PUSH_IMAGE)

    image_build
    image_push
else
    cat ./src/usage.txt
    echo ""
    echo "- - - - - - - - - - - - - - - - - - -"
    echo "Generating sample... './src/build-env'"
    cat ./src/usage.txt | tail -n 7 > ./src/build-env
fi