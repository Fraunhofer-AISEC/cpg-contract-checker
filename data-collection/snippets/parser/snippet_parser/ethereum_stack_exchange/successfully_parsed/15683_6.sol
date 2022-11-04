pragma solidity ^0.4.6;



contract E {

    uint public x;

    event LogUpdate(uint newXValue);

    function set(uint _x) public returns(bool success) {
        x = _x;
        LogUpdate(x);
        return true;
    }

}




contract EInterface {
    uint public x;
    function set(uint _x) returns(bool success) {} 
}

contract F {

    address addressE;

    
    

    function F(address EAddress) {
        addressE = EAddress;
    }

    function setE(uint num) public returns(bool) {
        
        
        EInterface e = EInterface(addressE); 
        return e.set(num);
    }

    function getE() public constant returns(uint E) {
        EInterface e = EInterface(addressE);
        return e.x();  
    }

}
