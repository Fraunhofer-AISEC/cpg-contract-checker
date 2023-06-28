pragma solidity ^0.5.2;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "../node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract OwnToken is Ownable, ERC20 {

    constructor() public {
    }
}
