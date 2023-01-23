from solidity:
TypeError: Function cannot be declared as view because this expression (potentially) modifies the state.
  --> Modifiers.sol:22:38:
   |
22 |     function balanceOf() public view accrueInterest returns (uint) {
   |                                      ^^^^^^^^^^^^^^
