pragma solidity >=0.4.22 <0.7.0;
pragma experimental ABIEncoderV2;

contract C {
    
    struct Friends{
        string name;
    }
    
    struct Person{
        string name;
        Friends[] friends;
    }
    
    mapping(string => Person) persons;
    
    
    
    function map(string memory name)public{
        
        
        Person memory person;
        persons[name] = person;
    }
     
}
