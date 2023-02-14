   function AddSignature(string[][] memory _signature) public{
         for ( uint i = 0 ; i < _signature.length; i++ ) {
           
           require(!_studentExists[_signature[i][0]]);
         signatures[_signature[i][0]] = _signature[i][1];
         _studentExists[_signature[i][0]]=true;
          }  
}
