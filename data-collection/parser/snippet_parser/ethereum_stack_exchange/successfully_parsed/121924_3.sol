function remover(address forRemOwner) external { 
    require(msg.sender == recoverer, "You are not allowed to do that");
    

    bytes memory data = abi.encodeWithSignature(
        "removeOwner(address,address,uint256)", 
        recoverer, 
        forRemOwner,
         
        1
    );
    safe.execTransactionFromModule(
        address(safe),
        0,
        data,
        Enum.Operation.Call
    );
}
