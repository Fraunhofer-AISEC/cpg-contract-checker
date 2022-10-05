contract LoanTokens{ 
    function _transfer(address _from, address _to, uint _value);
    mapping (address => uint256) public balanceOf;
    function sellBack(uint tokensSelling);
    uint256 public tokenPrice;
}


contract LoanForCFL{

}
