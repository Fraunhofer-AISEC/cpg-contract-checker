
uint256 multipleOf = 0.05 ** 18;

modifier isMultiple(){
   require(msg.value % multipleOf == 0);
   _;
}
