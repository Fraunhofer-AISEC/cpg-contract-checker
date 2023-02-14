from solidity:
TypeError: Linearization of inheritance graph impossible
  --> sss.sol:23:1:
   |
23 | contract sss is ERC1155, Ownable, Pausable, ERC2981, ERC1155Supply, ERC1155Holder, ERC1155Burnable, IERC1155MetadataURI {
   | ^ (Relevant source part starts here and spans across multiple lines).
