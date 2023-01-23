pragma solidity ^0.6.6;

    contract Test{
        address[] public addressArray;
    
        function f() public {
            addressArray.push(msg.sender);
        }
    }
