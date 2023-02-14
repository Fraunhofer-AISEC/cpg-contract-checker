function getSlice(string memory source, int startPos, int numChars) public pure returns (string memory) {
    
       int _numChars = 0;
       if (numChars <1 ) {
           _numChars = (int(source.length())-startPos) + 1;
       } else {
           _numChars = numChars;
       }
     
       return source._substring(_numChars, startPos-1);
    }
 
