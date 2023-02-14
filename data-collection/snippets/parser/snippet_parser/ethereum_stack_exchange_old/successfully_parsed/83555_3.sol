contract SendEther {
        function sendViaCall (address payable _to) public payable {
            (bool sent, bytes memory data) = _to.call.value(msg.value)("");
            require (sent, "failed to send ether");
        }
}
