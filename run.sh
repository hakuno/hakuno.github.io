#!/bin/bash
JEKYLL_VERSION=3.8.6
JEKYLL_PORT=80

if [[ "${1}" == "build" ]] || [[ ! -d vendor ]]
then
  docker run --rm \
    --volume="$PWD:/srv/jekyll" \
    --volume="$PWD/vendor/bundle:/usr/local/bundle" \
    -it jekyll/jekyll:$JEKYLL_VERSION \
    jekyll build
fi

echo -e "Should run on http://localhost:${JEKYLL_PORT}...\n---"

docker run --rm \
  --volume="$PWD:/srv/jekyll" \
  --volume="$PWD/vendor/bundle:/usr/local/bundle" \
  --publish 0.0.0.0:$JEKYLL_PORT:4000/tcp \
  --name jekyll \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll serve