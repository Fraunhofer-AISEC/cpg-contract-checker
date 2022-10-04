contract FirstContract{
    String public myString;
    
    address owner;
    mapping (address => bool) isSecondContract;
    
    modifier onlySecondContract {
        require(isSecondContract[msg.sender]);
        _;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    function setIsSecondContract(address _address, bool _value) public onlyOwner {
        isSecondContract[_address] = _value;
    }

    function setMyString(String memory what) public onlySecondContract {
        myString=what;
    }
}
