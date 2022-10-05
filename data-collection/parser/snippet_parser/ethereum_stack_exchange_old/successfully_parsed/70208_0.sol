contract Test{
    function test1(address payable addr, uint256 value) payable public {
        addr.transfer(value);
    }
}
