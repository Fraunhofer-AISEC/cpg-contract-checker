TypeError: Different number of components on the left hand side (1) than on the right hand side (2).
  --> contracts/NFTMarketplace.sol:98:9:
   |
98 |         uint[2] memory royalty = royaltyInfo(_tokenId, price);
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


TypeError: Type address is not implicitly convertible to expected type uint256[2] memory.
  --> contracts/NFTMarketplace.sol:98:9:
   |
98 |         uint[2] memory royalty = royaltyInfo(_tokenId, price);
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


TypeError: Explicit type conversion not allowed from "uint256" to "address payable".
   --> contracts/NFTMarketplace.sol:105:9:
    |
105 |         payable(royalty[0]).transfer(royalty[1]);
