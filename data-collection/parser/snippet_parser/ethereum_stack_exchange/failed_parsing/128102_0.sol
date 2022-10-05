TypeError: Type struct smartcontract.Book memory is not implicitly convertible to expected type string storage ref.
  --> contracts/Solidity part 4 (Mapping).sol:24:33:
   |
24 |         mybooks[msg.sender][id]=Book(_title,_author);
   |   

                          ^^^^^^^^^^^^^^^^^^^^
