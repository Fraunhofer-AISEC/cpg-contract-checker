public RemoteCall<Type> getCounter() {
    final Function function = new Function(
            FUNC_GETCOUNTER, 
            Arrays.<Type>asList(), 
            Arrays.<TypeReference<?>>asList(new TypeReference<Uint>() {}));
    return executeRemoteCallSingleValueReturn(function);
}
