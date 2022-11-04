Future<String> startElection(String name,Web3Client ethclient) async{

  var response = await callFunction('startElection', [name], ethclient, owner_private_key);
  print("election started successfully");

  return response;
}


Future<String> callFunction(String funcname,List<dynamic>args,Web3Client ethClient,String privateKey) async{

  EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
  DeployedContract contract = await loadcontract();

  final ethfunction = contract.function(funcname);
  final result = ethClient.sendTransaction(
      credentials,Transaction.callContract(contract: contract, function: ethfunction, parameters: args),
    chainId: null,fetchChainIdFromNetworkId: true);

  return result;
}
