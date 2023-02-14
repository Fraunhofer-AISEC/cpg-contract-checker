pragma solidity ^0.8.0;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract Token is ERC20{
    address public admin;
    constructor() ERC20('MyToken', 'MTN'){
        _mint(msg.sender, 10000 * 10 ** 18);
        admin = msg.sender;
    }

    function mint(address to, uint ammount) external{
        require(msg.sender == admin, "Only Admin Can Mint");
        _mint(to, ammount);
    }

    function burn(uint ammount) external {
        _burn(msg.sender, ammount);
    }

}
