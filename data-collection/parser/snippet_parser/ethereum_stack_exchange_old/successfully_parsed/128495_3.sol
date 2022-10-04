
pragma solidity >=0.7.0 <0.9.0;
    
contract c1 {
    uint a;
    constructor(){
        a=100;
    }
    function changeA(uint _a) public{
        a=_a;
    }
}

contract c2 is c1{
    function getA() public view returns(uint){
        return a;
    }
    function change(uint _a) public{
        changeA(_a);
    }
}
