
contract OtherContract{
  MyContract public myContract;

  struct NetworkConfig {
        bool myBool;
        uint256 myNum;
    }

  function getMyContractNetworkConfig() public returns(memory NetworkConfig){
    return myContract.activeNetworkConfig();
  }

}
