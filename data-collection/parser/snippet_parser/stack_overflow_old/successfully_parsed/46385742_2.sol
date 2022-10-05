pragma solidity ^0.4.0;

interface tokenRecipient {
    function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData);
}

contract MyContract is tokenRecipient {
    function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) {
        
    }
}
