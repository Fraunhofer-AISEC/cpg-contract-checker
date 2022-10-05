
pragma solidity ^0.8.12;


import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract tokenA is ERC20 {
    address public deployer; 
    
    constructor() ERC20('Token', 'token') { 
        _mint(msg.sender, 1000000000000 * 10 ** 10); 
        deployer = msg.sender;  
    }

    

    function burn (uint amount) external {  
        _burn(msg.sender, amount);
    }
}
