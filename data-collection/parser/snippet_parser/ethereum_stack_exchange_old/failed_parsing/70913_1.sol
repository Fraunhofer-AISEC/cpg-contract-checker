Compiling ./contracts/Fallback.sol...
Compiling ./contracts/Migrations.sol...
Compiling openzeppelin-solidity/contracts/ownership/Ownable.sol...

/home/awile/smart_contracts/ethernaut/contracts/Fallback.sol:16:48: TypeError: Type function () view returns (address) is not implicitly convertible to expected type address.
        if(contributions[msg.sender] > contributions[owner]) {
                                                     ^---^
,/home/awile/smart_contracts/ethernaut/contracts/Fallback.sol:17:4: TypeError: Expression has to be an lvalue.
            owner = msg.sender;
            ^---^
,/home/awile/smart_contracts/ethernaut/contracts/Fallback.sol:17:12: TypeError: Type address is not implicitly convertible to expected type function () view returns (address).
            owner = msg.sender;
                    ^--------^
,/home/awile/smart_contracts/ethernaut/contracts/Fallback.sol:31:3: TypeError: Expression has to be an lvalue.
        owner = msg.sender;
        ^---^
,/home/awile/smart_contracts/ethernaut/contracts/Fallback.sol:31:11: TypeError: Type address is not implicitly convertible to expected type function () view returns (address).
        owner = msg.sender;
                ^--------^
Compilation failed. See above.
