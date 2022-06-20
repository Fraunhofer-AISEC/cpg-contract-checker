pragma solidity ^0.8;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract MyContract is Ownable {
    function transferOwnership(address newOwner) public virtual override onlyOwner {
        
    }
}
