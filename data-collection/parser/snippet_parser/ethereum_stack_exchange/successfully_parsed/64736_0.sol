pragma solidity ^0.5;
import "./ConvertLib.sol";

contract A {
    mapping(address => address[]) public inves;

    function totalInves() public view returns(uint) {
        return(inves[msg.sender].length);
    }

}
