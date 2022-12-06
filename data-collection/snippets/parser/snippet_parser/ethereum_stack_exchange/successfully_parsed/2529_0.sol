contract constantOrPublic {
    address creator;
    address otheraddress;

    function constantOrPublic(address _otheraddress) 
    {
        creator = msg.sender;
        otheraddress = _otheraddress;
    }

    function getConstant() constant returns(address) {
        return otheraddress;
    }
    function getPublic() public returns(address) {
        return otheraddress;
    }

}
