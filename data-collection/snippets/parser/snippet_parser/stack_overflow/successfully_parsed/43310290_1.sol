contract Deployer{
    
    function deploy(bytes memory _bytecode) external payable returns (address addr){
        assembly{
            
            
            
            addr := create(callvalue(), add(_bytecode,0x20),mload(_bytecode))
            
        }
        
        require(addr !=address(0),'deploy failed');
    }

   function getByteCode() external pure returns (bytes memory){
      bytes memory bytecode=type(Test).creationCode;
      return bytecode;
}
}
