contract Mapping {

    mapping (uint256 => uint256) public map;
    
    function write(uint256 index, uint256 data) public {
        map[index] = data;
    }
}

contract MyContract {
    
    Mapping big_array = new Mapping();
    
    function write(uint256 index, uint256 data) public {
        big_array.write(index,data);
    }
    
    function read(uint256 index) public returns (uint256) {
        return big_array.map(index); 
    }
    
    function newMap() public {
        delete big_array;
        big_array = new Mapping();    
    }
    
}
