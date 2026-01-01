#!/bin/bash
# Detect file type and use appropriate viewer

file_type=$(file -b --mime-type "$1")
extension="${1##*.}"

# Check by extension first
case "$extension" in
    patch|diff)
        bat --language=diff --style=full --color=always "$1"
        ;;
    *)
        # Check by content type
        case "$file_type" in
            text/x-diff|text/x-patch)
                bat --language=diff --style=plain --color=always "$1"
                ;;
            text/*)
                bat --style=plain --color=always "$1"
                ;;
            *)
                cat "$1"
                ;;
        esac
        ;;
esac

