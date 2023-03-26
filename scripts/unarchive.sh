#!/bin/bash

get_archive_type() {
    file="$1"
    if [[ "$file" =~ \.tar\.gz$ ]]; then
        echo "tar.gz"
    elif [[ "$file" =~ \.tar\.bz2$ ]]; then
        echo "tar.bz2"
    elif [[ "$file" =~ \.tar\.xz$ ]]; then
        echo "tar.xz"
    elif [[ "$file" =~ \.gz$ ]]; then
        echo "gz"
    elif [[ "$file" =~ \.bz2$ ]]; then
        echo "bz2"
    elif [[ "$file" =~ \.xz$ ]]; then
        echo "xz"
    elif [[ "$file" =~ \.7z$ ]]; then
        echo "7z"
    elif [[ "$file" =~ \.rar$ ]]; then
        echo "rar"
    elif [[ "$file" =~ \.zip$ ]]; then
        echo "zip"
    else
        echo "unknown"
    fi
}

extract_archive() {
    file="$1"
    type="$2"
    case "$type" in
        tar.gz)
            tar -xzf "$file"
            ;;
        tar.bz2)
            tar -xjf "$file"
            ;;
        tar.xz)
            tar -xJf "$file"
            ;;
        gz)
            gunzip "$file"
            ;;
        bz2)
            bunzip2 "$file"
            ;;
        xz)
            unxz "$file"
            ;;
        7z)
            7z x "$file"
            ;;
        rar)
            unrar x "$file"
            ;;
        zip)
            unzip "$file"
            ;;
        *)
            echo "Unknown archive type: $type"
            exit 1
            ;;
    esac
}

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <file>"
    exit 1
fi

file="$1"
type="$(get_archive_type "$file")"
if [[ "$type" == "unknown" ]]; then
    echo "Unknown file type: $file"
    exit 1
fi

extract_archive "$file" "$type"
