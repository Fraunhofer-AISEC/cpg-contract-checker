contract DynamicContract {
    address dynLib;

    function updateLib(address _lib) public {
        dynLib = _lib;
    }

    function getLibAddress() public view returns(address) {
        return dynLib;
    }
}
