pragma solidity ^0.4.18;

    contract EthProj {

        event Message(uint8[] message, address add, uint256 cost);
        event Username(uint8[] name, address add, uint256 cost);

        function setMessage(uint8[] _fMessage) public {

            uint8[] memory output = new uint8[](_fMessage.length);

            output = _fMessage;

            emit Message(output, msg.sender, gasleft());
        }

        function setUsername(uint8[] _userName) public {
            emit Username(_userName, msg.sender, gasleft());
        }

    }
