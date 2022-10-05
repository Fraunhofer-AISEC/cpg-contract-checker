
pragma solidity ^0.4.13;

contract Project
{
    struct Person {
        string name;
        uint funds;
    }

    
    
    mapping(address => Person) public people;

    
    
    function getPerson(address id)
        public
        returns (string name, uint funds)
    {
        
        Person memory p = people[id];

        
        
        return (p.name, p.funds);
    }
}
