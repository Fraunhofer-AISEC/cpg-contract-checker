contract SendMSG {
    function Send(address sendTo, bytes calldata message) public {
        OtherContract other = OtherContract(sendTo);
        other.send(message);
    }
}
