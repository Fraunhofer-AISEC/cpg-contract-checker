pragma solidity ^0.4.22;

import "openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol";

contract HaioToken is MintableToken {
    string public name = "Haio Token";
    string public symbol = "HAI";
    uint8 public decimals = 18;

    uint256 public cap;

    constructor(uint256 _cap) public {
        cap = _cap;
    }

    function test(address _to) public returns (bool) {
        return true;    
    }

}
