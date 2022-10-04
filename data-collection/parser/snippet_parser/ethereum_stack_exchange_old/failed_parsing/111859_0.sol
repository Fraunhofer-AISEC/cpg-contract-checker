> Compilation warnings encountered:

    Warning: Visibility for constructor is ignored. If you want the contract to be non-deployable, making it "abstract" is sufficient.
   --> project:/contracts/CCGG_all.sol:139:3:
    |
139 |   constructor() VRFConsumerBase(__vrfCoordinatorAddress, __linkTokenAddress) public {
    |   ^ (Relevant source part starts here and spans across multiple lines).

,Warning: Visibility for constructor is ignored. If you want the contract to be non-deployable, making it "abstract" is sufficient.
  --> project:/contracts/Simple-Chainlink.sol:27:3:
   |
27 |   constructor() VRFConsumerBase(__vrfCoordinatorAddress, __linkTokenAddress) public {
   |   ^ (Relevant source part starts here and spans across multiple lines).


TypeError: Immutable variables cannot be read during contract creation time, which means they cannot be read in the constructor or any function or modifier called from it.
   --> @chainlink/contracts/src/v0.8/VRFConsumerBase.sol:167:5:
    |
167 |     LINK.transferAndCall(vrfCoordinator, _fee, abi.encode(_keyHash, USER_SEED_PLACEHOLDER));
    |     ^^^^

,TypeError: Immutable variables cannot be read during contract creation time, which means they cannot be read in the constructor or any function or modifier called from it.
   --> @chainlink/contracts/src/v0.8/VRFConsumerBase.sol:167:26:
    |
167 |     LINK.transferAndCall(vrfCoordinator, _fee, abi.encode(_keyHash, USER_SEED_PLACEHOLDER));
    |                          ^^^^^^^^^^^^^^
