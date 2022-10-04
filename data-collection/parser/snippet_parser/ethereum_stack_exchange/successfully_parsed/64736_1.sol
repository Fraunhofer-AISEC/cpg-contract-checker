pragma solidity ^0.5;
import "./ConvertLib.sol";
import "./A.sol";

contract B is A {
    function total() public view returns(uint) {
        return(inves[msg.sender].length);
    }
}
