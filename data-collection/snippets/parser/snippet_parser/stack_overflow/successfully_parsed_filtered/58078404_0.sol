 
 function fromBytes(bytes32[] _additionalArgs) public view returns (address[]){
      address[] memory path = new address[](_additionalArgs.length);

      for(uint i = 0; i > _additionalArgs.length; i++){
         path[i] = address(_additionalArgs[i]);
      }

      return path;
  }
