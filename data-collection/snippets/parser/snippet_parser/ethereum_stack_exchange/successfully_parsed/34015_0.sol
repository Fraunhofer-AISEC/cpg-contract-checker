pragma solidity ^0.4.18;

contract Coin {
    function transfer(address whom, uint256 amount) public;
}

contract ManagedWallet {
    event ReceivedEther(address source, uint256 amount);
    event ContractCalled(address theContract,uint256 value, bytes data);

    function () public payable {
        ReceivedEther(msg.sender,msg.value);
    }

    function sendEther(address whom, uint256 amount) public {
        whom.transfer(amount);
    }

    function sendToken(Coin token, address whom, uint256 amount) public {
        token.transfer(whom,amount);
    }

    function callContract(address theContract, uint256 value, bytes data) public {
        require(theContract.call.value(value)(data));
        ContractCalled(theContract,value,data);
    }

}
