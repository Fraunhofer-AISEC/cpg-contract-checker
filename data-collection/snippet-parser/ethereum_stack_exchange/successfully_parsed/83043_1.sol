contract A {

    event Log(address addr);

    function() external {
        emit Log(bytesToAddress(msg.data));
    }

    function bytesToAddress(bytes memory source) public pure returns(address addr) {
        assembly {
            addr := mload(add(source, 0x14))
        }
    }
}
