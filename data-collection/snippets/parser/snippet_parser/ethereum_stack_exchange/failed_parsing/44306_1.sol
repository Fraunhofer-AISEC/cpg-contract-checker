          browser/habibconcert.sol:12:11: TypeError: Expression has to be an lvalue.
      firstObject.tickets = new_tickets;
      ^-----------------^


            browser/habibconcert.sol:12:33: TypeError: Type uint256 is not implicitly convertible to expected type function () view external returns (uint256).
      firstObject.tickets = new_tickets;
                            ^---------^ 

                       browser/habibconcert.sol:14:33: TypeError: Expression has to be an lvalue.
      uint updateTickets =  firstObject.tickets  = firstObject.tickets + new_tickets;
                            ^-----------------^

                                       browser/habibconcert.sol:14:56: TypeError: Operator + not compatible with types function () view external returns (uint256) and uint256
      uint updateTickets =  firstObject.tickets  = firstObject.tickets + new_tickets;
                                                   ^-------------------------------^                      

                           browser/habibconcert.sol:14:11: TypeError: Type function () view external returns (uint256) is not implicitly convertible to expected type uint256.
      uint updateTickets =  firstObject.tickets  = firstObject.tickets + new_tickets;
      ^----------------------------------------------------------------------------^
