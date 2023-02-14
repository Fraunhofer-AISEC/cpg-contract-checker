pragma solidity ^0.4.23;

contract Test {
        bytes32 name; 

        function go() public {
            name = 'this is a test';
            require(false, "Error in script");
            name = 'another test';
        }

}
