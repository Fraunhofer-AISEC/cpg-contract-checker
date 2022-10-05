pragma solidity ^0.8.0;




import "./IER721.sol";

contract OwnerNFT{
    IERC721 public NFT;

    function tranferNFT(
             uint256 idNFT,
             address _to
    )public returns(bool){
      ...    
      NFT.Transfer(address(this),_to, idNFT);    
     ...
    }

    
    constructor(address NFT) {
          NFT = IERC721 (NFT);
     }
}
