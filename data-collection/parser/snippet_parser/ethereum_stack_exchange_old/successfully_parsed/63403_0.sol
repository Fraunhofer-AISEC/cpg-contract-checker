pragma solidity ^0.5;

contract Base {
    uint256 basevar = 0;
    constructor() public {
        basevar = 1;
    }
}

contract Base2 {
    uint256 basevar2 = 2;
    constructor() public {
        basevar2 = 1;
    }
}

contract C is Base, Base2 {
    uint256 cvar = 0;

    function getCvar() public view returns(uint256) {
        return cvar;
    }

    function getBasevar () public view returns(uint256) {
        return basevar;
    }

}
