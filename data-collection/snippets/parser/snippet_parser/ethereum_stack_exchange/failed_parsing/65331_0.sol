Test.sol:25:22: TypeError:
 Member "val1" not found or not visible after argument-dependent lookup in function () view external returns (string s1, string s2, uint256 val1 memory,uint256,uint256,uint256,uint256,address).
        Assert.equal(partProductionContract.production.val1, _val1, "msg.sender: ");
                     ^------------------------------------------^
Compilation failed. See above.
Truffle v5.0.1 (core: 5.0.1)
Node v11.6.0
