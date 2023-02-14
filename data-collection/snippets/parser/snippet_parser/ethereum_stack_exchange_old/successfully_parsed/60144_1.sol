pragma solidity ^0.4.24;

contract test{

    struct mStruct {
        string message;
        address sender;
        uint balance;
    }

    function testme() public pure returns(bytes32) {

        mStruct memory message = mStruct("Receiver closing signature", 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c, 100);
        return keccak256(abi.encode(message.message, message.sender, message.balance));
    }
}
