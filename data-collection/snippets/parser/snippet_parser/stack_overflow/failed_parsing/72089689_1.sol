    public static boolean compare(Client client, ContractId contractId, int guess) throws TimeoutException, PrecheckStatusException
    {
         
        ContractCallQuery contractQuery = new ContractCallQuery()
             
             .setGas(100_000) 
             
             .setContractId(contractId)
             
             .setFunction("compare", new ContractFunctionParameters().addUint32(guess))
             
             
             .setQueryPayment(new Hbar(4)); 

        
        ContractFunctionResult getMessage = contractQuery.execute(client);

        
        return getMessage.getBool(0);
    }
