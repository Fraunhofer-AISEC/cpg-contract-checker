pragma ton-solidity >= 0.51.0;
pragma AbiHeader expire;

struct someStruct {
    string foo;
    uint32 bar;
}

contract Contract {

    mapping (address => someStruct) _myMapping;

    constructor() public
    {
        tvm.accept();
        _myMapping[msg.sender] = someStruct("quz", now);
    }

    function func() external view returns(mapping (address=>someStruct))
    {
        return _myMapping;
    }
}
