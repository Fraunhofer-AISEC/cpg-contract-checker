interface Called{
    function set(uint);
    function get() view returns (uint);
}

contract Caller {

    Called public called_address;

    function set_address(address _addy) {
        called_address = Called(_addy);
    }

    function set(uint256 _var) {
        called_address.set(_var);
    } 

    function set_call(address _called, uint256 _var) {
        _called.call(bytes4(sha3("set(uint256)")), _var);
    }
}
