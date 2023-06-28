contract Test {
   mapping (address => uint256) public balanceOf;

   function test(address _address, uint256 _value) {
       balanceOf[_address] = _value;
   }
}
