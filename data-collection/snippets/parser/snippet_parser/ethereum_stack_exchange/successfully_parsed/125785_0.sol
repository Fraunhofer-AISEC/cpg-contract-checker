pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.5.0/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor() ERC20("MyToken", "MTK") {
        _mint(address(this), 500 * 10 ** decimals());
    }
   
    function testTra(address _to, uint _amount) public{
        transfer(_to,_amount);
    }
}
