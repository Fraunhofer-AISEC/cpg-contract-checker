pragma solidity 0.4.25;

interface IDataAbstractionLayer {
    function getX(uint key) external view returns (uint);
    function getY(uint key) external view returns (uint);
    function getZ(uint key) external view returns (uint);
}
