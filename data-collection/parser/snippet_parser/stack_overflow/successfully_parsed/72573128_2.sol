    contract test{
event readAlert(string str);
    function Alert() public returns (string memory) {
    string memory str = "Alert! Do Something.";
    return str;
    emit readAlert(str);
    }
}
