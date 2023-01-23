pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    uint256 _transactionMaxValue = 1000000;

    constructor() ERC20("MyToken", "MyT") {
        _mint(msg.sender, 1000000);
    }

    
    function transfer(address recipient, uint256 amount) override virtual public returns (bool) {
        if(_transactionMaxValue > 0){
         require(_transactionMaxValue >= amount, "You can not transfer more than 1000000 tokens at once!");
        }
        
        return super.transfer(recipient, amount);
    }
}
