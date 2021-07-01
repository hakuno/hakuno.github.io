#!/bin/bash
export JEKYLL_VERSION=3.8.6

docker run --rm \
  --volume="$PWD:/srv/jekyll" \
  --volume="$PWD/vendor/bundle:/usr/local/bundle" \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll build

docker run --rm \
  --volume="$PWD:/srv/jekyll" \
  --volume="$PWD/vendor/bundle:/usr/local/bundle" \
  --publish 0.0.0.0:80:4000/tcp \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll serve