MintedCrowdsale.sol:

24:   {
25:     
26:     require(MintableToken(address(token)).mint(_beneficiary, _tokenAmount));
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

debug(development:0xb76ce508...)> i

Transaction halted with a RUNTIME ERROR.

This is likely due to an intentional halting expression, like assert(), require() or revert(). It can also be due to out-of-gas exceptions. Please inspect your transaction parameters and contract code to determine the meaning of this error.
