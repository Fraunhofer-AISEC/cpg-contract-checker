contract test1{
    
    uint256 public number;
    address public sender;
    
    function setNumber(uint256 _number) public {
        number = _number;
        sender = msg.sender;
    }
}

contract test2{
    bool public success;
    
    function sendNumber(address _contractaddress) public {
        (bool _success,) = address(_contractaddress).call(abi.encodeWithSignature("setNumber(uint256)", 69));
        success = _success;
    }
}
