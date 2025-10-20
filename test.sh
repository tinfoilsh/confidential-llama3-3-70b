#!/bin/bash

fetch-tfshim() {
    resp=$(curl -sL https://api.github.com/repos/tinfoilsh/tfshim/releases/latest)
    tag=$(echo $resp | jq -r ".tag_name")
    digest=$(echo $resp | jq -r '.assets[0].digest')
    echo "$tag@$digest"
}