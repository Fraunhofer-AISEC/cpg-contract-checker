Argument of type 'import("/home/cromewar/Solidity-Projects/full_defi_app/dev/front_end/node_modules/@ethersproject/contracts/lib/index").Contract' is not assignable to parameter of type 'import("/home/cromewar/Solidity-Projects/full_defi_app/dev/front_end/node_modules/@usedapp/core/node_modules/@ethersproject/contracts/lib/index").Contract'.
  Types of property '_runningEvents' are incompatible.
    Type '{ [eventTag: string]: RunningEvent; }' is not assignable to type '{ [eventTag: string]: RunningEvent; }'. Two different types with this name exist, but they are unrelated.
      'string' index signatures are incompatible.
        Type 'RunningEvent' is not assignable to type 'RunningEvent'. Two different types with this name exist, but they are unrelated.
          Types have separate declarations of a private property '_listeners'.  TS2345

    23 |     
    24 |     const { send: approveErc20Send, state: approveAndStakeErc20State } =
  > 25 |         useContractFunction(erc20Contract, "approve", {
       |                             ^
    26 |             transactionName: "Approve ERC20 transfer",
    27 |         })
    28 |
