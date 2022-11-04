pragma solidity >0.4.99 <0.6.0;
contract D {
    uint public x;
    constructor(uint a) public payable {
        x = a;
    }
}
contract C {
    D d = new D(4); 
    function createD(uint arg) public {
        D newD = new D(arg);
        newD.x();
    }
    function createAndEndowD(uint arg, uint amount) public payable {
        
        D newD = (new D).value(amount)(arg);
        newD.x();
    }
}
