Contract Other {
    function bar(address token, address receiver, uint256 amount, uint256 a) {
        bytes4 sig = bytes4(sha3("foo(uint256)"));
        uint256 argsSize = 1 * 32;
        
        uint256 dataSize = 4 + argsSize;

        bytes memory m_data = new bytes(dataSize);

        assembly {
            
            mstore(add(m_data, 0x20), sig)
            
            mstore(add(m_data, 0x24), a)
        }

        token.transfer(receiver, amount, m_data);
    }
}
