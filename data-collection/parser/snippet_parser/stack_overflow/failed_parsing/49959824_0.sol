interface Graph {
function getNeighbours(uint8 id) external view returns (uint8[8]);
function getOrder() external view returns (uint8);
function isNeighbour(uint8 strFrom, uint8 strTo) external view returns 
(bool success);

}

contract DataStructure is Graph {
....code....
uint8 order;
constructor (uint8 size) {
order = size;
}
....code...
}
