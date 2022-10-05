pragma solidity 0.5.11;

contract MappingStructArray {

    struct S1 {
        uint a;
        bool b;
    }

    struct S2 {
        mapping(uint => S1[]) s1Arrays;
    }

    mapping(uint => S2) S2Structs;

    function pushS1(uint key, uint g, uint a, bool b) public {
        S2 storage s2 = S2Structs[key];
        S1 memory s1 = S1({
            a: a,
            b: b
        });
        s2.s1Arrays[g].push(s1);
    }
}
