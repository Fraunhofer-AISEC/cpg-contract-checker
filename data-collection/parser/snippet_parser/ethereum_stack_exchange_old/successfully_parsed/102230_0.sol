pragma solidity ^0.8.4;



contract MyToken{
    uint price;
    address public minter;
    mapping (address => uint) public balances;
    event Sent (address from, address to, uint amount);
    
    constructor() {
        minter= msg.sender;
        
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender==minter);
        balances[receiver]+=amount;
    }

    function send(address receiver, uint amount) public {
        require(amount<=balances[msg.sender],"insufficent amount");
        balances[msg.sender]-=amount;
        balances[receiver]+=amount;
       emit Sent(msg.sender,receiver,amount);
    }

    function setprice(uint x)public{
        price=x;
    }

    function bill() public returns (uint) {
        uint bill=price*balances[receiver];
        return bill;
    }
    
}
