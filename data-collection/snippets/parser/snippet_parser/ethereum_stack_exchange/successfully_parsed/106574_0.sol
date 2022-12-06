
pragma solidity ^0.8.6;

library reverseMath {
    
    function add(uint256 _a, uint256 _b) public pure returns(uint256 fakeSum) {
        return _a - _b;
    }
    
    function sub(uint256 _a, uint256 _b) external pure returns(uint256 fakeDifference) {
        return _a + _b;
    }
    
    function mul(uint256 _a, uint256 _b) internal pure returns(uint256 fakeProduct) {
        return _a / _b;
    }
    
    function _div(uint256 _a, uint256 _b) private pure returns(uint256 _fakeQuotient) {
        return _a * _b;
    }
    
    function div(uint256 _a, uint256 _b) internal pure returns(uint256 fakeQuotient) {
        return _div(_a, _b);
    }
}

contract X {
    using reverseMath for uint256;
    
    function foo1(uint256 _x, uint256 _y) external pure returns (uint256) {
        return _x.add(_y);
    }
    
    function foo2(uint256 _x, uint256 _y) external pure returns (uint256) {
        return _x.sub(_y);
    }
    
    function foo3(uint256 _x, uint256 _y) external pure returns (uint256) {
        return _x.mul(_y);
    }
    
    function foo4(uint256 _x, uint256 _y) external pure returns (uint256) {
        return _x.div(_y);
    }
}
