pragma solidity 0.4.25;

import "./IDataAbstractionLayer.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract DataAbstractionLayer is IDataAbstractionLayer, Ownable {
    struct Record {
        uint256 x;
        uint256 y;
        uint256 z;
    }

    mapping(address => Record) public records;

    function getX(uint key) external view returns (uint) {return records[key].x;}
    function getY(uint key) external view returns (uint) {return records[key].y;}
    function getZ(uint key) external view returns (uint) {return records[key].z;}

    function set(uint key, uint x, uint y, uint z) external onlyOwner {
        records[key] = Record({x: x, y: y, z: z});
    }
}
