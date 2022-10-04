
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Custodian is Ownable {

    function helloWorld() public pure returns(string memory){
        return "Hello World";
    }

    function goodByeWorld() public view onlyOwner returns(string memory){
        return "Goodbye World";
    }
}
