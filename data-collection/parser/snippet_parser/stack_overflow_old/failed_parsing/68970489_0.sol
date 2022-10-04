project:/contracts/Passport.sol:102:47: TypeError: This type is only supported in the new experimental ABI encoder. Use "pragma experimental ABIEncoderV2;" to enable the feature.
  function getPassport() public view returns (Person memory) {
                                              ^-----------^
,project:/contracts/Passport.sol:108:41: TypeError: This type is only supported in the new experimental ABI encoder. Use "pragma experimental ABIEncoderV2;" to enable the feature.
  (uint256 incidentTime, address owner, Person memory person) {
                                        ^------------------^

Compilation failed. See above.
Truffle v5.4.3 (core: 5.4.3)
Node v16.3.0
