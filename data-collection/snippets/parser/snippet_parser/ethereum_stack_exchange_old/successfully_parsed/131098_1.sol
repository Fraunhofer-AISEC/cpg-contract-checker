
pragma solidity 0.8.7;

contract MyContract {
    struct NetworkConfig {
        bool myBool;
        uint256 myNum;
    }

    NetworkConfig public activeNetworkConfig = NetworkConfig({myBool: true, myNum: 1});
}

contract OtherContract{
  MyContract public myContract;

  struct NetworkConfig {
        bool myBool;
        uint256 myNum;
    }
   constructor(address myContractAddress){
        myContract = MyContract(myContractAddress);
   }

  function getMyContractNetworkConfig() public returns(NetworkConfig memory){
    return myContract.activeNetworkConfig();
  }

}
