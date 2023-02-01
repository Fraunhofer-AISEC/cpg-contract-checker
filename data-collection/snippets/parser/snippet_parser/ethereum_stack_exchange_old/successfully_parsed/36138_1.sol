function compareStrings (string a, string b) view returns (bool){
       return keccak256(a) == keccak256(b);
   }
