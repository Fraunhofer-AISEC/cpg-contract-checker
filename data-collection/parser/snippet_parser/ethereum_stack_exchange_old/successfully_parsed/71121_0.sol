pragma solidity ^0.5.1;

contract owner {
    address public owner;

    function owned() public {
        owner = msg.sender;
    }

    function set( string memory _data) public {
        data = _data;
    }


modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

function transferOwnership(address newOwner) onlyOwner public {
        owner = newOwner;
    }
}

interface tokenRecipient { function receiveApproval( address  _from, uint256  _value,  address _token, bytes _extradata) public; }
