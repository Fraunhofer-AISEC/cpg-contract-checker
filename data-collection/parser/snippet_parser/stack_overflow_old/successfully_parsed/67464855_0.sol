

pragma solidity 0.8.4;

import "./1_Storage.sol";

contract Test {
    
    Storage stg;
    constructor() {
        stg = new Storage();
    }
    
    function getter() public view returns(uint256) {
        return stg.retrieve();
    }
    
    function setter(uint256 val) public {
        stg.store(val);
    }
}
