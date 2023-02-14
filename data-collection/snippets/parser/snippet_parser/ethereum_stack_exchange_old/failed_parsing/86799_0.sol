Error: Error compiling source with solc v0.6.0: contracts/flattened.sol:60:1: ParserError: Source file requires different compiler version (current compiler is 0.6.0+commit.26b70077.Linux.g++ - note that nightly builds are considered to be strictly less than the released version
pragma solidity ^0.6.2;
^---------------------^

        > command: `/home/graphicaldot/.solcx/solc-v0.6.0 --allow-paths /home/graphicaldot/Programs/python_programs/dgm-contracts-security-audit-env/dgm-contracts-security-audit --standard-json`
        > return code: `0`
        > stderr:
        {"errors":[{"component":"general","formattedMessage":"contracts/flattened.sol:60:1: ParserError: Source file requires different compiler version (current compiler is 0.6.0+commit.26b70077.Linux.g++ - note that nightly builds are considered to be strictly less than the released version\npragma solidity ^0.6.2;\n^---------------------^\n","message":"Source file requires different compiler version (current compiler is 0.6.0+commit.26b70077.Linux.g++ - note that nightly builds are considered to be strictly less than the released version","severity":"error","sourceLocation":{"end":1971,"file":"contracts/flattened.sol","start":1948},"type":"ParserError"}],"sources":{}}
