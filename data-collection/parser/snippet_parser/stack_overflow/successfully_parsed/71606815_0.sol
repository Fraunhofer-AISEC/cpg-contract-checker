pragma solidity  ^0.5.7;

contract Coin {
    address public minter;
    mapping(address => uint) public balances;

    event sent(address from, address to, uint amount);

    constructor() {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[require] += amount;
    }

    error InsufficientBalance(uint requested, uint available);

    function send(address receiver, uint amount) public {
        if(amount > balances[msg.sender])
           revert InsufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });    
        
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit sent(msg.sender, receiver, amount);
    }
}
