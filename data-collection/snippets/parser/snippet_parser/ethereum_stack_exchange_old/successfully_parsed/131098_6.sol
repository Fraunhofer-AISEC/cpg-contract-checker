
pragma solidity 0.8.7;

contract MyContract {

    struct NetworkConfig {
        bool myBool;
        uint256 myNum;
    }

    NetworkConfig public activeNetworkConfig = NetworkConfig({myBool: true, myNum: 1});
}

contract OtherContract{

    struct NetworkConfig {
        bool myBool;
        uint256 myNum;
    }

    MyContract public myContract;

    constructor(address _myContract){
        myContract=MyContract(_myContract);
    }


    function getMyContractNetworkConfig() public view returns (NetworkConfig memory){
        (bool myBool, uint myNum) = myContract.activeNetworkConfig();
        return NetworkConfig(myBool,myNum);
    }
}
