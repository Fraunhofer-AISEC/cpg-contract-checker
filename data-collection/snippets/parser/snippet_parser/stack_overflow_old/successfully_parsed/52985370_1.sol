contract ApproveAndCall {
    function receiveApproval(address _sender, uint256 _amount, address _addressOfToken, bytes _extraData) external {
        emit ReceiveApproval(_sender, _amount, _addressOfToken, _extraData);
    }
}

contract ApproveAndCall2 {
    function() public {
        emit Fallback(msg.data);
    }
}
