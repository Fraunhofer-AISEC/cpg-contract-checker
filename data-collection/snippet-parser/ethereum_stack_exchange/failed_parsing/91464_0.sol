

pragma solidity 0.6.11;

contract MyContract {
   string[] public tmp;
   ...

   function read_tmp() public view returns(string[] memory){
      return tmp;
   }
}
