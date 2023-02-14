TypeError: Explicit type conversion not allowed from "int_const -1" to "uint256".
  --> contracts/WETH9.sol:78:64:
   |
78 |         if (src != msg.sender && allowance[src][msg.sender] != uint(-1)) {}
   |                                                                ^^^^^^^^


Error HH600: Compilation failed

**The code is as follows.**

if (src != msg.sender && allowance[src][msg.sender] != uint(-1)) {
            require(allowance[src][msg.sender] >= wad);
            allowance[src][msg.sender] -= wad;
        }
