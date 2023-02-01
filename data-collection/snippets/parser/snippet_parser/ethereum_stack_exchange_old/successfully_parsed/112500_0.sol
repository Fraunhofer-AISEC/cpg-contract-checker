pragma solidity 0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract NGE is ERC20 {
    address public owner;
    mapping(address => bool) public haveAccess;
    constructor() ERC20("Neon", "NGE") {
        _mint(msg.sender, 1000000*10**16);
        owner = msg.sender;
    }

    function giveAccess(address to) public returns(bool){
        require(msg.sender == owner, "only the owner can give access to this contract");
        haveAccess[msg.sender] = true;
        return(true);
    }

    function minter(address to, uint256 amount) public{
        require(msg.sender == owner || haveAccess[msg.sender] == true);
        _mint(to, amount);
    }
}
