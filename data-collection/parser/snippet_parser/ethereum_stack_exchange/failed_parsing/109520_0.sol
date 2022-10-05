DeclarationError: Undeclared identifier.
  --> project:/contracts/YieldToken.sol:97:50:
   |
97 |         _beforeTokenTransfer(operator, from, to, _asSingletonArray(id), _asSingletonArray(amount), data);
   |                                                  ^^^^^^^^^^^^^^^^^

,DeclarationError: Undeclared identifier.
  --> project:/contracts/YieldToken.sol:97:73:
   |
97 |         _beforeTokenTransfer(operator, from, to, _asSingletonArray(id), _asSingletonArray(amount), data);
   |                                                                         ^^^^^^^^^^^^^^^^^

,DeclarationError: Undeclared identifier.
  --> project:/contracts/YieldToken.sol:99:31:
   |
99 |         uint256 fromBalance = _balances[id][from];
   |                               ^^^^^^^^^

,DeclarationError: Undeclared identifier.
   --> project:/contracts/YieldToken.sol:102:13:
    |
102 |             _balances[id][from] = fromBalance - amount;
    |             ^^^^^^^^^

,DeclarationError: Undeclared identifier.
   --> project:/contracts/YieldToken.sol:104:9:
    |
104 |         _balances[id][to] += amount;
    |         ^^^^^^^^^

,DeclarationError: Undeclared identifier.
   --> project:/contracts/YieldToken.sol:108:9:
    |
108 |         _doSafeTransferAcceptanceCheck(opertor, from, to, id, amount, data);
    |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


Compilation failed. See above.
