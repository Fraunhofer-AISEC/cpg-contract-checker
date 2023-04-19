

function decodeMsgData_ExternalFunction(
    address to,
    uint256 value,
    address origSender
) public  returns (address _to, uint _value, address _origSender) {
    (_to, _value, _origSender) = decodeMsgData(msg.data);
}
