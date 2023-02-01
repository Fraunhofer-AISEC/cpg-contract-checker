contract Test {
    bytes32 public lastblockhashused;
    uint public lastblocknumberused;
    uint public AA;

    function Test() {
        lastblocknumberused = (block.number-1)  ;               
        lastblockhashused = block.blockhash(lastblocknumberused);
    }

    function getTest1() constant returns (uint) {
        return uint(lastblockhashused) & 0xfff;
    }

    function Test2() {
        AA = (uint(lastblockhashused) & 0xfff);
    }

    function getTest2AA() constant returns (uint) {
        return AA;
    }
}
