pragma solidity ^0.5.8;

import "./lib.sol";

contract Importer {
    
    function doSom (address _address) public pure returns (bool) {
        require(lib.isZero(_address));
        return true;
    }   
}
