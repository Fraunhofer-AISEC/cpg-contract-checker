pragma solidity ^0.4.21;


contract MyTokenI {function transfer(address _to, uint256 _value) public; }

contract ADTest {

    
    MyTokenI myToken;

    
    function ADTest(address _myToken) public {
        
        myToken = MyTokenI(_myToken);
    }

    function CallTransfer(address _to, uint256 _value) public {
        
        myToken.transfer(_to, _value);
    }

}
