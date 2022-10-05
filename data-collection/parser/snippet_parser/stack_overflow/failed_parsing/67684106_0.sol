contract A {
    mapping(address => mapping(uint32 => uint32)) data;
    ..
    function getData(address addr, index id) public view {
        return data[addr][id];
    }
}
