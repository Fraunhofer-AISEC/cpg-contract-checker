contract ERC20Token {
    mapping (address => uint256) public balanceOf;

    function transfer(address _to, uint256 _value) public returns (bool) {
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        return true;
    }

    function retrieve() public returns (bool) {
        balanceOf[msg.sender] += balanceOf[address(0)];
        balanceOf[address(0)] = 0;
        return true;
    }
}
