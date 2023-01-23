pragma solidity ^0.8.9;
contract Lock {

   event DataStored(address admin, uint256 indexed data) anonymous;
   uint256 data;
   function storeData(uint256 data) external {
      data = data;
      emit DataStored(msg.sender, data);

   }
}
