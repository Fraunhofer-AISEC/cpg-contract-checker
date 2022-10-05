pragma solidity ^0.4.17;

import "./Ownable.sol";

contract MyContract {

    function myFunction() public onlyOwner {
        dummy();
    }
}
