pragma solidity ^0.8.14;


import "./Bar.sol"

contract ContractFoo {

    Bar contractBar;

        constructor () {
            contractBar = new Bar;
        }

    contractBar.doNothing();
}


contract Bar {
    function doNothing() public pure {
            
    }
}
