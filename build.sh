#!/bin/bash


if [ -z "$1" ]; then
    echo "❌ Use: $0 <file.s>"
    exit 1
fi

SRC="$1"
BASENAME="${SRC%.*}"  

echo "Building $SRC..."

as -o "$BASENAME.o" "$SRC" && \
ld -o "$BASENAME" "$BASENAME.o" && \
echo "Executable generated: ./$BASENAME"