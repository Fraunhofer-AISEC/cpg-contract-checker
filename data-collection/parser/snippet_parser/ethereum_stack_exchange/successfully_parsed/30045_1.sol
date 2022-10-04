pragma solidity ^0.4.18;

import './Candy.sol';


contract Wrapper {

    Candy private candy;
    address public owner;

    function linkTest(Candy _candy) public {
        require(address(_candy) != 0x0);
        address candyOwner = _candy.owner();
        require(candyOwner != 0x0);
        owner = candyOwner;
        candy = _candy;
    }
}
