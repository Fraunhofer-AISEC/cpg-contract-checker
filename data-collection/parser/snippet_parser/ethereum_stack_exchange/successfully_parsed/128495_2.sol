
pragma solidity >=0.7.0 <0.9.0;
    
contract c1 {
    uint a;
    constructor(){
        a=100;
    }
}

contract c2 is c1{
    function getA() public view returns(uint){
        return a;
    }
}
