    public static String tryNumberGuess(Client client, ContractId contractId, int guess) throws TimeoutException, PrecheckStatusException
{
     
    ContractCallQuery contractQuery = new ContractCallQuery()
         
         .setGas(1000_000) 
         
         .setContractId(contractId)
         
         .setFunction("guess", new ContractFunctionParameters().addUint256(new BigInteger(""+guess)))
         
         
         .setQueryPayment(new Hbar(4)); 

    
    ContractFunctionResult getMessage = contractQuery.execute(client);

    
    return getMessage.getString(0);
}
