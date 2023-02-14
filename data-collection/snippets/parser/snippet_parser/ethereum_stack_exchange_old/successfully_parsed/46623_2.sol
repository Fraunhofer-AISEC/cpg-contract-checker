contract Ballot {
    
    Arithmetic.Data d;

    
    using Arithmetic for Arithmetic.Data;

    function bar(bytes1 a) public view returns (uint8) {
        
        
        bytes1 b = d.doSomeMath(a, 3);
        return uint8(b);
    }
}
