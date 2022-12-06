pragma solidity ^0.4.9;

contract Oursurance {
    address public creator;
    uint x;

    function() payable { x = 1; }

    function Oursurance() payable {
        creator = msg.sender;
    }

    function reject() payable {
        selfdestruct(creator);
    }

    function send(address target, uint256 amount) payable {
        if (!target.send(amount)) throw;
    }

    function destroy(address target) payable {
        selfdestruct(0x0000000000000000000000000000000000000000);
    }
}
