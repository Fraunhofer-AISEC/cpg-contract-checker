 pragma solidity 0.7.4;

 contract MyToken {
    address public minter;

    mapping (address => uint) public balances;
    
    constructor(){
        minter = msg.sender;
    }
    
    function mint(address receiver, unit amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }
}

