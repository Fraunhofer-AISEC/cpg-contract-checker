contract t {
    function tb20(bytes memory _b) 
    public
    pure
    returns (bytes20 _result) {
        assembly {
            _result := mload(add(_b, 0x20))
        }
    }

    function bytesToAddress(bytes memory _b) 
    public 
    returns (address) {
        return address(tb20(_b));
    }
}
