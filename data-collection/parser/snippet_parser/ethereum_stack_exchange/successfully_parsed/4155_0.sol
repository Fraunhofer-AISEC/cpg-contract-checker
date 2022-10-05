contract test {
    mapping (uint => address) public testmap;

    function add_to_map  (uint _key, address _val) public{
        testmap[_key] = _val;
    }
    function get_from_map(uint _key) returns (address){
        return testmap[_key];
    }   
}
