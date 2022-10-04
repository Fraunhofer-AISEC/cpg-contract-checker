pragma solidity ^0.4.24;

contract StackExchangeSol{

    struct Foo{
        uint x;
    }

    mapping(uint => Foo[]) foo;
    
    uint[] indexOf;
    

    function add(uint id, uint _x) public {
        foo[id].push(Foo(_x));
        
        count++;
        
    }

    function get(uint id, uint index) public view returns(uint){
        return foo[id][index].x;
    }
    
    uint count;
    constructor() public{
        count=0;
    }
    


    
    function getLenOf() public view returns(uint){
        return indexOf.length;

    }
    
}
