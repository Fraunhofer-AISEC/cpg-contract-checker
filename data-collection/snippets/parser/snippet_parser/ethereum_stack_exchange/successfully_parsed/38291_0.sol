contract ERC20 {
    function totalSupply() constant returns (uint totalSupply);
    function balanceOf(address _owner) constant returns (uint balance);
    function transfer(address _to, uint _value) returns (bool success);
    event Transfer(address indexed _from, address indexed _to, uint _value);
}

contract Test{

    ERC20 icoToken;

    function Test(){
        icoToken = ERC20(0x86fa049857e0209aa7d9e616f7eb3b3b78ecfdb0);
        
    }

    function getMyBalance(address myAddress) constant returns (uint256 theB){
        theB = icoToken.balanceOf(myAddress);
        return theB;
    }
}
