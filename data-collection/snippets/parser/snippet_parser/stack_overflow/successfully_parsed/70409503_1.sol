pragma solidity 0.8.10;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract Test {
    IERC20 public test ;

    function clearTest() public {
        delete test;
    }

}
