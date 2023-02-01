library L {
    function concat(bytes memory a, bytes memory b) internal pure returns (bytes memory) {
        return abi.encodePacked(a, b);
    }
}

contract Swaper0x {
    using L for bytes;  
}