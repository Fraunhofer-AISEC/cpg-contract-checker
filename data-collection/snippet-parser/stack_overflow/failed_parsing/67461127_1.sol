TypeError: Contract "IERC721" should be marked as abstract.
 --> /Users/delete/transfer-proxy/contracts/TransferProxy.sol:7:1:
  |
7 | contract IERC721 is IERC165 {
  | ^ (Relevant source part starts here and spans across multiple lines).
Note: Missing implementation:
  --> /Users/delete/transfer-proxy/contracts/TransferProxy.sol:16:5:
   |
16 |     function approve(address to, uint256 tokenId) public;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Missing implementation:
  --> /Users/delete/transfer-proxy/contracts/TransferProxy.sol:12:5:
   |
12 |     function balanceOf(address owner) public view returns (uint256 balance);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Missing implementation:
  --> /Users/delete/transfer-proxy/contracts/TransferProxy.sol:17:5:
   |
17 |     function getApproved(uint256 tokenId) public view returns (address operator);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Missing implementation:
  --> /Users/delete/transfer-proxy/contracts/TransferProxy.sol:19:5:
   |
19 |     function isApprovedForAll(address owner, address operator) public view returns (bool);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Missing implementation:
  --> /Users/delete/transfer-proxy/contracts/TransferProxy.sol:13:5:
   |
13 |     function ownerOf(uint256 tokenId) public view returns (address owner);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Missing implementation:
  --> /Users/delete/transfer-proxy/contracts/TransferProxy.sol:14:5:
   |
14 |     function safeTransferFrom(address from, address to, uint256 tokenId) public;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Missing implementation:
  --> /Users/delete/transfer-proxy/contracts/TransferProxy.sol:20:5:
   |
20 |     function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Missing implementation:
  --> /Users/delete/transfer-proxy/contracts/TransferProxy.sol:18:5:
   |
18 |     function setApprovalForAll(address operator, bool _approved) public;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Missing implementation:
 --> /Users/delete/transfer-proxy/contracts/TransferProxy.sol:4:5:
  |
4 |     function supportsInterface(bytes4 interfaceId) external view returns (bool);
  |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: Missing implementation:
  --> /Users/delete/transfer-proxy/contracts/TransferProxy.sol:15:5:
   |
15 |     function transferFrom(address from, address to, uint256 tokenId) public;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

,TypeError: Functions without implementation must be marked virtual.
  --> /Users/delete/transfer-proxy/contracts/TransferProxy.sol:12:5:
   |
12 |     function balanceOf(address owner) public view returns (uint256 balance);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

,TypeError: Functions without implementation must be marked virtual.
  --> /Users/delete/transfer-proxy/contracts/TransferProxy.sol:13:5:
   |
13 |     function ownerOf(uint256 tokenId) public view returns (address owner);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

,TypeError: Functions without implementation must be marked virtual.
  --> /Users/delete/transfer-proxy/contracts/TransferProxy.sol:14:5:
   |
14 |     function safeTransferFrom(address from, address to, uint256 tokenId) public;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

,TypeError: Functions without implementation must be marked virtual.
  --> /Users/delete/transfer-proxy/contracts/TransferProxy.sol:15:5:
   |
15 |     function transferFrom(address from, address to, uint256 tokenId) public;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

,TypeError: Functions without implementation must be marked virtual.
  --> /Users/delete/transfer-proxy/contracts/TransferProxy.sol:16:5:
   |
16 |     function approve(address to, uint256 tokenId) public;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

,TypeError: Functions without implementation must be marked virtual.
  --> /Users/delete/transfer-proxy/contracts/TransferProxy.sol:17:5:
   |
17 |     function getApproved(uint256 tokenId) public view returns (address operator);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

,TypeError: Functions without implementation must be marked virtual.
  --> /Users/delete/transfer-proxy/contracts/TransferProxy.sol:18:5:
   |
18 |     function setApprovalForAll(address operator, bool _approved) public;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

,TypeError: Functions without implementation must be marked virtual.
  --> /Users/transfer-proxy/contracts/TransferProxy.sol:19:5:
   |
19 |     function isApprovedForAll(address owner, address operator) public view returns (bool);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

,TypeError: Functions without implementation must be marked virtual.
  --> /Users/transfer-proxy/contracts/TransferProxy.sol:20:5:
   |
20 |     function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Compilation failed. See above.
Truffle v5.3.1 (core: 5.3.1)
Node v12.14.0
