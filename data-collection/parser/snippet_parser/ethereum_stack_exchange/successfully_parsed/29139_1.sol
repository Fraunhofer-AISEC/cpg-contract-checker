pragma Solidity ^0.4.7;
import "remix_tests.sol"; 

contract Test {

    function testPackingAndHashing() public pure returns (bytes, bytes, bytes32, bytes32) {
        address x1 = 0x0123456789012345678901234567890123456789;
        address x2 = 0x0123456789012345678901234567890123456789;
        uint256 y1 = 0x0000000000000000000000000000000000000000000000000000000000000001;
        uint256 y2 = 0x0000000000000000000000000000000000000000000000000000000000000001;
        return (abi.encodePacked(x1, x2, y1, y2), abi.encodePacked(x1, y1, x2, y2), 
            keccak256(abi.encodePacked(x1, x2, y1, y2)), keccak256(abi.encodePacked(x1, y1, x2, y2)));
    }
}
