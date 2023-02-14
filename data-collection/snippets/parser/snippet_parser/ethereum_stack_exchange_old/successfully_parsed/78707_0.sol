pragma solidity ^0.6.1;

contract Sample{

    struct Structure{
        uint a;
        string b;
    }

    mapping(string => Structure) public s;

    function add(uint a, string memory b)public {
        s[b] = Structure(a,b);
    }
}
