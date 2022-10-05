
pragma solidity ^0.5.15;
import "Token.sol";

contract TokenTimeSol{
    Token public token;
    address public beneficiary;
    uint public releaseTime;

    constructor(Token _token, address _beneficiary, uint _releaseTime) public{
        require(_releaseTime >= block.timestamp);
        token = _token;
        beneficiary = _beneficiary;
        releaseTime = _releaseTime;
    }

    function releaseTokens() public{
        require(block.timestamp >= releaseTime);
        uint _amount = token.balanceOf(address(this));
        require(_amount > 0);
        token.transfer(beneficiary, _amount);
    }
}
