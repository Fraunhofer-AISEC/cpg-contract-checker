debug(development:0x7655ecf8...)> 

Pacta.sol:

115:     
116:     function withdraw() public managers isActive {
117:         uint256 part = address(this).balance / beneficiaries.length;
                            ^^^^^^^^^^^^^^^^^^^^^                        

debug(development:0x7655ecf8...)> 

Transaction halted with a RUNTIME ERROR.

This is likely due to an intentional halting expression, like assert(), require() or revert(). It can also be due to out-of-gas exceptions. Please inspect your transaction parameters and contract code to determine the meaning of this error.
