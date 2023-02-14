

pragma solidity >=0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract HelpingArtistsAtRisk is ERC20 {
    constructor(uint256 initialsupply) ERC20 ("Helping Artists At Risk", "HAAR"){
        _mint(msg.sender,initialsupply);}
}
