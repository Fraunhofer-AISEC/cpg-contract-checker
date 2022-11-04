pragma solidity ^0.8.0;
import "./Contr.sol";

contract SystemAPI{


    function createContr() public returns (address) {
        Contr c = new Contr("one two");
        
        return address(c);
        
    }

    function signContract(address addr) public {
        Contr c = Contr(addr);
        c.sign(msg.sender);
    }

    function checkSigned(address addr) public returns(bool) {
        Contr c = Contr(addr);
        return c.checkSigned(msg.sender);
    }

    
    
    
    
}
