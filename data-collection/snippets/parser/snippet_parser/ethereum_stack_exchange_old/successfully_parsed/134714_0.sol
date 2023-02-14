
pragma solidity >=0.7.0 <0.9.0;

contract TxUserWallet {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    function transferTo(address payable dest, uint amount) public {
        
        require(tx.origin == owner);
        dest.transfer(amount);    
    }
}
