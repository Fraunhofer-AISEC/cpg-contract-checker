
pragma solidity >= 0.7.0 <0.9.0;

import "./Token.sol";
import "./safemath.sol";

contract SwapToken {
    using SafeMath for uint;

    Token public token1;
    address public owner1;
    Token public token2;
    address public owner2;
    uint public amount1;
    uint public amount2;
    uint public swapRate;

    constructor(
        address _token1,
        address _owner1,
        address _token2,
        address _owner2,
        uint _amount1
    ) {
        token1 = Token(_token1);
        owner1 = _owner1;
        token2 = Token(_token2);
        owner2 = _owner2;
        swapRate = 3;
        amount1 = _amount1;
        amount2 = _amount1.mul(swapRate);
    }

    function swap() public {
        require(msg.sender == owner1 || msg.sender == owner2, "Not authorized from owners");
        require(
            token1.allowance(owner1, address(this)) >= amount1,
            "Token 1 allowance too low"
        );
        require(
            token2.allowance(owner2, address(this)) >= amount2,
            "Token 2 allowance too low"
        );

        _safeTransferFrom(token1, owner1, owner2, amount1);
        _safeTransferFrom(token2, owner2, owner1, amount2);
    }

    function _safeTransferFrom(
        Token token,
        address sender,
        address recipient,
        uint amount
    ) private {
        bool sent = token.transferFrom(sender, recipient, amount);
        require(sent, "Token transfer failed");
    }
}
