> Compiling ./contracts/NFT.sol

> Compilation warnings encountered:

    Warning: SPDX license identifier not provided in source file. Before publishing, consider adding a comment containing "SPDX-License-Identifier: <SPDX-License>" to each source file. Use "SPDX-License-Identifier: UNLICENSED" for non-open-source code. Please see https:
--> project:/contracts/Creation.sol


ParserError: Source "@openzeppelin/contracts/token/ERC721/ERC721.sol" not found: File import callback not supported
 --> project:/contracts/NFT.sol:6:1:
  |
6 | import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

,ParserError: Source "@openzeppelin/contracts/utils/Counters.sol" not found: File import callback not supported
 --> project:/contracts/NFT.sol:8:1:
  |
8 | import "@openzeppelin/contracts/utils/Counters.sol";
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

,ParserError: Source "@openzeppelin/contracts/access/Ownable.sol" not found: File import callback not supported
 --> project:/contracts/NFT.sol:9:1:
  |
9 | import "@openzeppelin/contracts/access/Ownable.sol";
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Compilation failed. See above.
Truffle v5.4.0 (core: 5.4.0)
Node v14.15.5
