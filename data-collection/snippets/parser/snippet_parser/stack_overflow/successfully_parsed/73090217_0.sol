contract Test {
    mapping(uint => address payable) public myMap; 
    uint[] public ticketId; 

    uint arrayLength = ticketId.length;

    function set(uint _numberticket) public { 
        for(uint i=arrayLength+1; i<arrayLength+_numberticket+1; i++) {
            ticketId.push(i); 
            myMap[ticketId[uint(i)]]=payable(msg.sender); 
        } 
    }
}
