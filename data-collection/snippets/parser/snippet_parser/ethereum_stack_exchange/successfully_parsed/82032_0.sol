pragma solidity 0.5.12;
contract A {
    event lmao (string);
    uint public x;
    function hello () public {
        emit lmao ('YES');
    }
    function setNumber (uint n) public {
        x=n;
    }
} 

pragma solidity 0.5.12;
contract B{
    address public to;    
    function callcontractA () public {
       to.call(abi.encodeWithSignature("hello()"));
    }   
    function setcontract (address x) public{
        to = x;
    }   
    function callsetNumbercontractA () public {
        
       to.call(abi.encodeWithSignature("setNumber(uint)",10));
    }
}
