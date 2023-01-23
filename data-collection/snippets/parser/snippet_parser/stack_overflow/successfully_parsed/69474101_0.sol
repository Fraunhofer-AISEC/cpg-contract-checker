
pragma solidity  ^0.8.0;



contract CryptoD {
    mapping(string => string) public signatures;
    mapping(string =>bool) _studentExists;


   function AddSignature(string[2][] memory _signature) public{
             for ( uint i = 0 ; i < _signature.length; i++ ) {
               
               require(!_studentExists[_signature[i][0]],"this provided address already exists !");
             signatures[_signature[i][0]] = _signature[i][1];
             _studentExists[_signature[i][0]]=true;
                 revert("Signature Added");
              }  
    }

  function SignatureOf(string memory owner) public view returns (string memory) {
             return signatures[owner];
             revert("here goes the OWNER");
    }


}


