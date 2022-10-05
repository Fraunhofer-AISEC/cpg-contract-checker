import "./myERC721Contract.sol";

contract MyERCMarketplace is myERC721Contract {

   … code…



   function cutCord() external {
      renounceOwnership();
   }   

}
