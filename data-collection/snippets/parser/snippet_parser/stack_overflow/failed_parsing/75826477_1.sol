public RemoteFunctionCall<TransactionReceipt> withdraw(BigInteger weiValue) {
        final Function function = new Function(
                FUNC_WITHDRAW,
                Arrays.<Type>asList(),
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function, weiValue);
}
