    pragma solidity ^0.4.18;

contract EtherTransfer {

    address public owner;

    function transfer() public {
    owner = 0x627306090abaB3A6e1400e9345bC60c78a8BEf57;
    owner.transfer(1000000000000000000);
    }

    function() payable public {}

function kill() public {
        if (msg.sender == owner)
        selfdestruct(owner);
    }

}
