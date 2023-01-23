#!/usr/bin/env sh

antlr -Dlanguage=Python3 ../../../../cpg-solidity/src/main/antlr/Solidity.g4 -o ./antlr -Xexact-output-dir
