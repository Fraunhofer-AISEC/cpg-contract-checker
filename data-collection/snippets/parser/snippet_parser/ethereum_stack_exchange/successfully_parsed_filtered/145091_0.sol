contract GetCode {
    function at(address _addr) public view returns (bytes memory o_code) {
        return _addr.code;
    }
}
