==== Exception State ====
SWC ID: 110
Severity: Medium
Contract: XXXXXXX
Function name: recipients(uint256)
PC address: 2067
Estimated Gas Usage: 1089 - 1184
An assertion violation was triggered.
It is possible to trigger an assertion violation. Note that Solidity assert() statements should only be used to check invariants. Review the transaction trace generated for this issue and either make sure your program logic is correct, or use require() instead of assert() if your goal is to constrain user inputs or enforce preconditions. Remember to validate inputs from both callers (for instance, via passed arguments) and callees (for instance, via return values).
--------------------
In file: something.sol:42

address payable[] public recipients
--------------------
Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}
Account: [SOMEGUY], balance: 0x0, nonce:0, storage:{}

Transaction Sequence:

Caller: [CREATOR], calldata: , value: 0x0
Caller: [ATTACKER], function: recipients(uint256), txdata: 0xd1bc76a10000000000000000000000000000000000000000000000000000000000000000, value: 0x0

