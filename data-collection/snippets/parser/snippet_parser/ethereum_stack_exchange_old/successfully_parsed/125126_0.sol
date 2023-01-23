function queryErc20BaseInfo(address a) public view returns(bool success, bytes memory list )
{
    (success , list) = address(a).staticcall(abi.encodeWithSignature("name()"));
    return (success , list);  
}
