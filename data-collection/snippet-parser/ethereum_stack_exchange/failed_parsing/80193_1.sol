    Compiling your contracts...
===========================
> Compiling .\contracts\Bet.sol
> Compiling .\contracts\Migrations.sol

/C/Users/Michael/ethereum/p60/contracts/Bet.sol:53:32: TypeError: Type int_const 0 is not implicitly convertible to expected type address payable.
        game.originator.addr = 0;
                               ^
,/C/Users/Michael/ethereum/p60/contracts/Bet.sol:57:27: TypeError: Type int_const 0 is not implicitly convertible to expected type address payable.
        game.taker.addr = 0;
                          ^
,/C/Users/Michael/ethereum/p60/contracts/Bet.sol:106:13: TypeError: "send" and "transfer" are only available for objects of type "address payable", not "address".
            origAddress.transfer(origPot/2);
