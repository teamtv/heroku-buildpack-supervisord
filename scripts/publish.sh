#!/usr/bin/env bash
# Classic Heroku buildpacks are referenced by their GitHub URL.
# Push this repo to GitHub, then add it to your app:
#
#   heroku buildpacks:add https://github.com/gitNbloks/heroku-buildpack-supervisord -a <app>
#
# This script just ensures the files are executable and pushes to origin.
set -euo pipefail

git update-index --chmod=+x bin/detect bin/compile bin/release
git add -A
git commit -m "Release buildpack" || echo "Nothing to commit"
git push origin main

echo "Pushed. Add to app with:"
echo "  heroku buildpacks:add https://github.com/TeamTV/heroku-buildpack-supervisord -a <app>"
