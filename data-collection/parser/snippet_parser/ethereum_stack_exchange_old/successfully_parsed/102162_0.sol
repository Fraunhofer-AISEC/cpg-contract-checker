contract test{
    uint256 public value;
    function _0() public payable{
        value += msg.value;
    }
    function _1() public payable{
        value -= (msg.value/2);
    }
    function main() external payable {
        _0();
        _1();
    }
}
