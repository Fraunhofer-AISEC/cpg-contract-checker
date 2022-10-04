pragma solidity ^0.4.0;

interface tokenRecipient {
    function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData);
}

contract RemoteContract {
    function func(address _addr, uint _value) {
        tokenRecipient _tokenRecipient = tokenRecipient(_addr);
        _tokenRecipient.receiveApproval(msg.sender, _value, address(this), empty);
    }
}
