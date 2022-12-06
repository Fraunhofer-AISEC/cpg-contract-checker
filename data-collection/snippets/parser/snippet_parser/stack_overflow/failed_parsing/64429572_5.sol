debug(development:0xdf7af41d...)> o

Transaction halted with a RUNTIME ERROR.

There was no revert message.  This may be due to an in intentional halting expression, such as assert(), revert(), or require(), or could be due to an unintentional exception such as out-of-gas exceptions.
Please inspect your transaction parameters and contract code to determine the meaning of this error.

Stacktrace:
Error: Revert or exceptional halt
  at unknown function [address 0xaA47e5555db895b230A16AF6860bf5DF442C7dB9] (/Users/someuser/projects/project-folder/contracts/GetNewToken.sol:40:24)
  at GetNewToken.buyTokens [address 0x4b4a5d3Ad0ed472876e50FB0daa6ED2FA78488e2] (/Users/someuser/projects/project-folder/contracts/GetNewToken.sol:40:24)
  at GetNewToken [address 0x4b4a5d3Ad0ed472876e50FB0daa6ED2FA78488e2] (/Users/someuser/projects/project-folder/contracts/GetNewToken.sol:27:5)

Location of error:

GetNewToken.sol:
         
40:         bool success = oldToken.transferFrom(msg.sender, address(this), _amount);
                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 

debug(development:0xdf7af41d...)> o
Transaction has halted; cannot advance.

