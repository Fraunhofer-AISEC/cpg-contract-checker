contract Mapping {
mapping (uint256 => uint256) public map;

function write(uint256 index, uint256 data) public {
map[index] = data;
}
}

contract MyContract {
Mapping big_array = new Mapping();
uint256 public last;
function write(uint256 index, uint256 data) public {
big_array.write(index,data);
}
function readMap(uint256 index) public returns (uint256) {
last = big_array.map(index); 
return last;
}
}
