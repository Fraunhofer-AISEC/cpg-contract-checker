
pragma solidity ^0.8.0;

import "@openzeppelin/contracts@4.1.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.1.0/token/ERC20/ERC20.sol";

contract Test is ERC721 {
    constructor() ERC721("TEST", "TEST") { }
    
    function test() public {
        emit Transfer(address(0), address(0), 100);
    }
}
