
pragma solidity ^0.6.10;

contract EthReceiver {
    address payable private owner;

    constructor() public {
        owner = msg.sender;
    }

    receive() external payable {
        require(msg.value > 0, "No ETH sent.");
    }

    function returnBalance() public view returns(uint) {
        return address(this).balance;
    }
}
