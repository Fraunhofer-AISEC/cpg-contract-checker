contract Test {
    address[] public addrs;
    mapping (address => uint256) public something;
    mapping (address => bool) public registered;
    function registerSomething(address _addr, uint256 _value) {
        require(!registered[_addr]);
        registered[_addr] = true;
        addrs.push(_addr);
        something[_addr] = _value;
    }
}
