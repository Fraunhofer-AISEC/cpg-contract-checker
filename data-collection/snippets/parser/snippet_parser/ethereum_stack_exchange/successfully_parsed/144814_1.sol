function get(bytes4 _val) public pure returns(bytes memory) {
        return abi.encode(_val);
}
