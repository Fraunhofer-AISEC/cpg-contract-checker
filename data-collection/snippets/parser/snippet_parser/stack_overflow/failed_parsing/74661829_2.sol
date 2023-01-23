`TypeError: Trying to override non-virtual function. Did you forget to add "virtual"?
  --> contracts/project/ERC721UpgradeableV1.sol:38:5:
   |
38 |     function _authorizeUpgrade(address newImplementation) internal override {
   |     ^ (Relevant source part starts here and spans across multiple lines).
Note: Overriding function is here:
  --> contracts/project/ERC721PaymentSplitter.sol:32:5:
   |
32 |     function _authorizeUpgrade(address newImplementation)
   |     ^ (Relevant source part starts here and spans across multiple lines).


TypeError: Trying to override non-`
