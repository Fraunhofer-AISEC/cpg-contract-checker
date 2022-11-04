pragma solidity ^0.4.0;

import "github.com/OpenZeppelin/zeppelin-solidity/contracts/math/SafeMath.sol";

contract MathExtended {
    using SafeMath for uint;
    function exec(uint a, uint b) returns (uint){
        return a.add(b);
    }
}
