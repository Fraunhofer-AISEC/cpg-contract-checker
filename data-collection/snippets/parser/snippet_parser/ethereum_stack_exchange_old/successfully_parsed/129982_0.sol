pragma solidity ^0.8.4;

contract AssemblyTest {

    function getFromMatrix(uint x, uint y, uint[][] memory matrix) external pure returns (uint) {
        
        return matrix[y][x]; 
    }

    function test() external view returns (uint) {
        bytes4 selector = this.getFromMatrix.selector;
        uint[][] memory matrix = new uint[][](3);
        for (uint i; i < 3; i++) {
          matrix[i] = new uint[](3);
          for (uint j; j < 3; j++) {
            matrix[i][j] = i * 3 + j;
          }
        }
        assembly {
            function allocate(size) -> ptr {
                ptr := mload(0x40)
                if iszero(ptr) { ptr := 0x60 }
                mstore(0x40, add(ptr, size))
            }
            let x := 1
            let y := 1
            let mem := allocate(0x64)
            mstore(mem, selector)
            mstore(add(mem, 0x04), x)
            mstore(add(mem, 0x24), y)
            mstore(add(mem, 0x44), matrix)
            let success := staticcall(gas(), address(), mem, 0x64, 0, 0x20)
            return (0, 0x20)
        }
    }
}
