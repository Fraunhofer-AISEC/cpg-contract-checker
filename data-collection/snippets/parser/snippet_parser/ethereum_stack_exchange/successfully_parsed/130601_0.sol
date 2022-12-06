
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20{
    constructor() ERC20("MyTryToken","MTT"){
        _mint(msg.sender,10000*10**decimals());
    }
}

contract MyTryToken{

    ERC20 tokenControl;

    constructor(address tokenAddress){
        tokenControl = ERC20(tokenAddress);
        tokenControl.approve(address(tokenControl),10000*10**tokenControl.decimals());
    }
    mapping(address=>uint) public balances;


    function buy(uint amount) public{
        tokenControl.transferFrom(address(tokenControl),msg.sender,100*10**18);
    } 
    
    
}
