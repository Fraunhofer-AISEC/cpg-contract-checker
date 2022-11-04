library StructLib {
    
    struct cup{
        uint value1;
        uint value2;
    }
}
interface IA {
    
    function cups(uint key) view external returns (StructLib.cup memory);
}

contract B{
    function getCup(uint key, address _A) view public returns (StructLib.cup memory) {
        StructLib.cup memory _cup = IA(_A).cups(key);
        return _cup;
    }
}

