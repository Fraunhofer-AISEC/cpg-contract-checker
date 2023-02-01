pragma solidity >=0.4.21 <0.8;
pragma experimental ABIEncoderV2;

contract Test {
    struct MyStruct {
        uint256 amount;
        address user;
        bool initialized;
    }

    mapping (address => MyStruct) private infos;

    function getStruct(address user) public view returns (MyStruct memory) {
        MyStruct memory myStruct = infos[user];
        require(myStruct.initialized, "! initialized");

        return myStruct;
    }
}
