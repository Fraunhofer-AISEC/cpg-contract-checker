pragma solidity >=0.5.0 <0.7.0;


contract TxUserWallet {
    address owner;

    constructor() public payable {
        owner = msg.sender;
    }

    function() external payable {}

    function transferTo(address payable dest, uint amount) public payable {
        
        dest.call.value(amount)("");
    }
}
