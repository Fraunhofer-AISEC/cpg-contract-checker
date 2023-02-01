TypeError: No matching declaration found after argument-dependent lookup.
--> Spaghetti Finance Rewards.sol:54:9:
|
54 | require(msg.sender.call{value: _value}("Transaction failed, check the fallback function, if it's payable or not."));
| ^^^^^^^
Note: Candidate: function require(bool)
Note: Candidate: function require(bool, string memory)
