pragma solidity 0.4.26;

import './IERC20Token.sol';

contract Tester {
    uint256 public gasUsed;

    function transfer(IERC20Token _token, address _to, uint256 _value) public {
        uint256 bgn = gasleft();
        require(_token.transfer(_to, _value));
        uint256 end = gasleft();
        gasUsed = bgn - end;
    }
}
