pragma solidity ^0.4.2;

contract Complain {
    
    struct compalins {
        uint id;
        string category;
        string desc;
        string complainer;
    }

    mapping( uint => complains) public newComplain;

    uint public complainCount;

    function Complain () public {
        addComplain("c1","bhbh","bybhb");
        addComplain("c2","bhbh","bybhb");
    }

    function addComplain (string _category,string desc,string complainer){
        complainCount ++;
       
    }
}
