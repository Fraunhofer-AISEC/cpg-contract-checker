pragma solidity ^0.4.24;

contract depo {
    function depo() public {

    }

    function () payable public {

    }

    function deposit() payable public {
        require(msg.value == 1 ether);
    }
}
