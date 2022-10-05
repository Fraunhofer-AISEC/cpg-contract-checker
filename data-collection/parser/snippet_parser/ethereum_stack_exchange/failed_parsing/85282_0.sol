contract TokenInterface {
function transfer(address _to, uint _value) public returns (bool success);
}

contract New {
    TokenInterface private token;
    constructor(address tokenAddr)public{
        token = TokenInterface(tokenAddr);
    }

    
    function echoBalance(address addr) public returns(uint balance){
        (bool success, bytes memory result) = address(0x92...4f).call(abi.encodeWithSignature("balanceOf(address)", addr));
        return abi.decode(result, (uint));
    }

    
    function transferTo(address addr, uint amount) public returns(bool success){
        (bool success, bytes memory result) = address(0x92...4f).delegatecall(abi.encodeWithSignature("transfer(address,uint)", addr, amount));
        return success;
        
            
    }
}
