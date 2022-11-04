
contract A {
    struct cup{
        uint value1;
        uint value2;
    }

    mapping(uint=>cup) public cups;

    
    function addCup(uint _key, uint _value1, uint _value2) public{
        cups[_key] = cup(_value1, _value2);
    }
}


interface IA {
    
    struct cup{
        uint value1;
        uint value2;
    }

    
    function cups(uint key) view external returns (cup memory);
}


contract B{
    function getCup(uint key, address _A) view public returns (IA.cup memory) {
        IA.cup memory _cup = IA(_A).cups(key);
        return _cup;
    }
}

