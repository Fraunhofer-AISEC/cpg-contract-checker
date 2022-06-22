contract myToken is ERC20{
   bool stateOfApprove;

   RINKEBYTOKEN WBTC = RINKEBYTOKEN(0x577D296678535e4903D59A4C929B718e1D575e0A);
   RINKEBYTOKEN USDT = RINKEBYTOKEN(0xD9BA894E0097f8cC2BBc9D24D308b98e36dc6D02);

   function approveWBTC() public{
       stateOfApprove = WBTC.approve(address(this), uint256(2**25));
       emit Approval(msg.sender, address(this), uint256(2**25));
   }

   function showWBTCAllowance() public view  returns(uint256){
       return WBTC.allowance(msg.sender, address(this));
   }

   function approveUSDT() public{
       stateOfApprove = USDT.approve(address(this), 2**25);
       emit Approval(msg.sender, address(this), 2**25);
   }

   function state() public view returns(bool){
       return stateOfApprove;
   }
}
