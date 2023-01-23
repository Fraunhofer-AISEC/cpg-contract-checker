contract Complex{
    uint a = 1;
    uint b = 3;
    mapping(uint => uint) myMap;

    function Complex(){
        myMap[a] = b;
    }
}
