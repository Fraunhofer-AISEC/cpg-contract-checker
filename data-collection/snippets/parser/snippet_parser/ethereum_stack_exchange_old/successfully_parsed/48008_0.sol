contract MyContract {
  function info() external view returns(uint min, uint max) {
    return(1, 2);
  }
}

contract Launchpad {

 function launch() public returns(address) {
   MyContract myContractAddress = new MyContract();
   return myContractAddress;
 }

}
