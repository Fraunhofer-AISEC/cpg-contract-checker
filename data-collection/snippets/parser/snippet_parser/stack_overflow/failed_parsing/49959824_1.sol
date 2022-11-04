pragma solidity ^0.4.22;

import "./DataStructure.sol";


contract Data is Graph {
.....code....
DataStructure public data;

    constructor(address MapAdr) public {
    ....code...
    data = DataStructure(MapAdr);
    ....code...
    }
.....code....
}
