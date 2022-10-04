TypeError: Invalid contract specified in override list: "AccessControl".
  --> project:/contracts/SampleContract.sol:15:9:
   |
15 |         override(AccessControl, IAccessControl)
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: This contract:
  --> @openzeppelin/contracts/access/AccessControl.sol:49:1:
   |
49 | abstract contract AccessControl is Context, IAccessControl, ERC165 {
   | ^ (Relevant source part starts here and spans across multiple lines).

Compilation failed. See above.
