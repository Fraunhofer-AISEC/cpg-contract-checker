

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Contract {
    function sendEth() public payable {
        require(msg.value > .02 ether, "Not enough ETH");
    }
}
