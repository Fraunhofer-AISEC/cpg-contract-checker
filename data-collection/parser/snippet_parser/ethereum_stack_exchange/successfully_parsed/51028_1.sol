pragma solidity ^0.4.23;

contract ArrayTes {

    uint256 public l;

    function secfun(uint256 a) public view returns(uint256) {

        l = l + a;
        return l;
    }
}
