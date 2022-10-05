pragma solidity ^0.5.0;


contract U256 {

    struct Request{
        string name;
        uint a;
        uint b;
        uint c;
        uint d;
        uint e;
        address a1;
        address a2;
    }

    Request[] contracts;
    uint index;

    constructor() public {
        contracts.push(Request('first',1,2,3,4,5,address(0),address(0)));
        contracts.push(Request('second',2,3,4,5,6,address(0),address(0)));
    }

    function getdeployedcontracts () public returns (string memory, uint,uint,uint,uint,uint,address,address) {

        Request memory request = contracts[index];

        index += 1;

        return (request.name,
                request.a,
                request.b,
                request.c,
                request.d,
                request.e,
                request.a1,
                request.a2);
    }
}
