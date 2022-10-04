


pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/utils/TokenTimelock.sol";

contract TimeLockTest is TokenTimelock {
    constructor() TokenTimelock(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 1654368599){

}
}