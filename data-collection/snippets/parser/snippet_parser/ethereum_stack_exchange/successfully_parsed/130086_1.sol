

pragma solidity ^0.8.7;

import '@openzeppelin/contracts/token/ERC20/IERC20.sol';
import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract ERC20TotalSupplyTest is ERC20 {
    event Msg(address addr);

    bytes public byteCode;
    uint public byteCodeLength;

    constructor() ERC20('simple', 'TST') {
        emit Msg(address(this));
        totalSupply();
        byteCode = address(this).code;
        byteCodeLength = byteCode.length;

        
        
    }
}
