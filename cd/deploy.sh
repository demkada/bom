#!/usr/bin/env bash

if [ "$TRAVIS_BRANCH" = 'master' ] && [ "$TRAVIS_PULL_REQUEST" == 'false' ]; then
    openssl aes-256-cbc -K $encrypted_bbc3e49aefb8_key -iv $encrypted_bbc3e49aefb8_iv -in cd/codesigning.asc.enc -out cd/signingkey.asc -d
    gpg --fast-import cd/signingkey.asc
    mvn deploy -P sign,build-extras --settings cd/mvnsettings.xml
fi