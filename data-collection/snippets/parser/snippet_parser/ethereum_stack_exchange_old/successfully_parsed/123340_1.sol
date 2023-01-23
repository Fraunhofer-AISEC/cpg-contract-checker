
pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2;
 
 
 contract ReplaceWord {

 
 function _stringReplace(string memory _URL, string memory _tokenID) public pure returns (string memory) {
        bytes memory _stringBytes = bytes(_URL);
        uint count = _stringBytes.length -1; 

        bytes memory idByte = bytes("{i");
        bytes memory word;
        

        bytes memory result = new bytes(count);
        

  for(uint i = 0; i < count; i++) {
        word = bytes.concat(_stringBytes[i],_stringBytes[i+1] );
        
      
        if (keccak256(word) == keccak256(idByte)){

            bytes memory firstHalf = new bytes(count);
            bytes memory secondHalf = new bytes(count);
            (firstHalf,secondHalf)= _splitString(_stringBytes,i);
  
            result= abi.encodePacked(firstHalf,_tokenID,secondHalf);
            _stringBytes = result;
            return string(result);

        }
     

    }
      return string(result);
 }


 function _splitString(bytes memory _stringBytes, uint splitPoint) internal pure returns (bytes memory, bytes memory){

      uint lenght = _stringBytes.length;
      bytes memory firstHalf = new bytes(splitPoint);
      bytes memory secondHalf = new bytes(lenght-splitPoint-4);


      for(uint n = 0; n < splitPoint; n++) {
      firstHalf[n] = _stringBytes[n];
      }

        
      for(uint x = 0; x < (lenght - splitPoint - 4); x++) {
      secondHalf[x] = _stringBytes[x + splitPoint + 4 ];
      }

      return (firstHalf, secondHalf);

 }


 }
