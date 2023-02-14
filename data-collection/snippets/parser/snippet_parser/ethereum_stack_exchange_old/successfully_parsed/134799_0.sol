contract ContractA {

    uint public lastResult;
    uint public opCount;
    event operation (address sender, uint parama, uint paramb);

    function add(uint a, uint b) public returns(uint){
        uint c = a + b;
        lastResult = c;
        opCount ++;
        emit operation(msg.sender, a,b);
        return c;
    }
}
