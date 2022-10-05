        function CallContract(address tosend,uint amount,bytes hexdata,uint zgas) public payable {
               tosend.call.gas(zgas).value(amount)(hexdata);
        }
