function deposit(uint256 amount) payable public {
   IDefiAdapter(defiAdapterAddress).deposit{value: amount}();
}
