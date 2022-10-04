public RemoteCall<TransactionReceipt> getName() {
    final Function function = new Function(
            FUNC_GETNAME, 
            Arrays.<Type>asList(), 
            Collections.<TypeReference<?>>emptyList());
    return executeRemoteCallTransaction(function);
}
