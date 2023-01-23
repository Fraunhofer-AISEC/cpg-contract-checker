interface A {
   function balanceOf(address _owner) external view returns (uint256);
 }

contract B {
 TOKEN public A;

   constructor(address _addr) public {
      TOKEN = A(_addr);
   }

   function _deposit(address _addr, uint256 _amount, uint8 stake_time) public {
     require(_amount <= TOKEN.balanceOf(_addr), "insufficient Balance");

     uint256 _bal = TOKEN.balanceOf(_addr);
    _bal = _bal.sub(_amount); 

    TOKEN.balanceOf(_addr) = TOKEN.balanceOf(_addr).sub(_amount); 
    TOKEN.transferFrom(_addr, address(this), _amount); 
    TOKEN.transfer(address(this), _amount);
  }
}
