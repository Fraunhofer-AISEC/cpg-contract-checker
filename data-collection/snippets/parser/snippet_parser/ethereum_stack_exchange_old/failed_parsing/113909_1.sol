Compiling your contracts...
===========================
> Compiling ./contracts/Staking.sol

TypeError: Operator == not compatible with types tuple(bool,uint256) and bool
  --> /Users/alexandre/WebstormProjects/alyraChallenge4Stacking/contracts/Staking.sol:72:17:
   |
72 |         require(isStakeholder(_address) == true || msg.sender == ownerOfContract, "this address is not a stakeholder");
   |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Compilation failed. See above.
Truffle v5.3.13 (core: 5.3.13)
Node v12.22.7
