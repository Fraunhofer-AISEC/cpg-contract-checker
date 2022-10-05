
pragma solidity 0.8.7;

contract MyContract {
    
    struct NetworkConfig {
        bool myBool;
        uint256 myNum;
    }

    NetworkConfig private activeNetworkConfig = NetworkConfig({
        myBool: true, 
        myNum: 1});

    function networkConfig() public view returns(NetworkConfig memory) {
        return activeNetworkConfig;
    }
}

contract OtherContract{
    MyContract public myContract;

    constructor(address myContractAddress){
        myContract = MyContract(myContractAddress);
    }

    function getMyContractNetworkConfig() public view returns(MyContract.NetworkConfig memory) {
        return myContract.networkConfig();
    }

}
