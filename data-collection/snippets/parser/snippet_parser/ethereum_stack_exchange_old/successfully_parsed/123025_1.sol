
pragma solidity 0.8.11;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {

    constructor() ERC20("ACDMToken", "AKDM") { 
    }

    function mint(address _from, uint _supply) public {
        _mint(_from, _supply);
    }
}

contract ACDMPlatform {
    address public token;

    constructor(address _ACDMToken) {
        token = _ACDMToken;
    }
    
    function startSaleRound(uint supply) public {
        Token t = new Token();
        t.mint(address(this), supply);
    }

}
