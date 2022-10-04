contract MyToken {
    
    mapping (address => uint256) public balanceOf;

    
    function MyToken(
        uint256 initialSupply
        ) {
        balanceOf[msg.sender] = initialSupply;              
    }

    
    function transfer(address sender, address _to, uint256 _value) {
        require(balanceOf[sender] >= _value);           
        require(balanceOf[_to] + _value >= balanceOf[_to]); 
        balanceOf[sender] -= _value;                    
        balanceOf[_to] += _value;                           
    }
}

contract MyTokenI {function transfer(address sender, address _to, uint256 _value) public; }

contract ADTest {

    
    MyTokenI myToken;

    
    function ADTest(address _myToken) public {
        
        myToken = MyTokenI(_myToken);
    }

    function CallTransfer(address _to, uint256 _value) public {
        
        myToken.transfer(msg.sender, _to, _value);
    }

}
