    contract contractB is mortal  {
        function invokeContractA() { 
            address contractAaddress= 0x1234567891234567891234567891234567891234;
            uint ValueToSend = 1234;
            contractAaddress.call.value(ValueToSend)(bytes4(sha3("func1(string,string)")),
                 "arg1TEXT", "arg2TEXT");
        }  
    }
