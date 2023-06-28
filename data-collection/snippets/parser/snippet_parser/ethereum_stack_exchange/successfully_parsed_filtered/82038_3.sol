pragma solidity 0.4.26;

import './IERC20Token.sol';

contract Tester1 {
    address public to;
    uint256 public value;

    function transfer(IERC20Token _token, address _to, uint256 _value) public returns (bool) {
        to = _to;
        value = _value;
        return _token.transfer(_to, _value);
    }
}

contract Tester2 {
    address public to;
    uint256 public value;

    function transfer(IERC20Token _token, address _to, uint256 _value) public returns (bool) {
        to = _to;
        value = _value;
        return true; 
    }
}
