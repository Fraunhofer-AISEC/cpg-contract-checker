function replaceString( string memory source, 
                        string memory stringToFind, 
                        string memory replacementString
                       ) 
                        public  view returns(string memory) {
    int startPos = findInString(source, stringToFind, 0);
    if (startPos == -1) return source;
    uint start =  uint(startPos);
    string memory beforeString;
    string memory afterString;
 
    if (start <= 1) {
        beforeString = "";
    } else {
        beforeString = getSlice(source, 1, start-1);
    }
    uint end = uint(beforeString.length() + stringToFind.length());
   
    if (end>= uint(source.length())) {
        afterString = "";
    } else {
        afterString = getSlice(source, end +1, uint(source.length())-end);
    }
    string memory retval = beforeString.concat(replacementString); 
    if(afterString.length()>0) {
       retval = retval.concat(afterString);
    }         
    return retval;
}

 function getSlice(string memory source, uint startPos, uint numChars) public pure returns (string memory) {
       uint ustartPos = uint(startPos -1);
       uint _numChars = uint(numChars);

        bytes memory sourcebytes = bytes(source);
       if (_numChars==0) {
           _numChars = ((sourcebytes.length - ustartPos) + 1);
       }
      
      bytes memory result = new bytes(_numChars);     

      for (uint i = 0; i<_numChars; i++) {
          result[i] = sourcebytes[i + ustartPos];
      }
      return string(result); 
    }

function findInString(string memory source, string memory findString, uint startAfter ) public  pure returns(int) {
        uint targetLength = findString.length();
        uint sourceLength = source.length();
         
        require(targetLength > 0 || sourceLength > 0, "missing param source or findingString");
        require (startAfter <= (sourceLength - targetLength) + 1, "startAfter is larger than source - findstring"); 
         
     
        
           
           
            
            
            
         uint sourceIndex = startAfter + 1;
         uint targetIndex = 1;
         
         string memory firstChar = charAt(findString, 1);
         
         while(sourceIndex <= (sourceLength - targetLength)) {
             
             
             int index = findChar(source, firstChar, sourceIndex -1);
             if (index == -1) {return -1;}  
             if (targetLength == 1) {return index;}  
             sourceIndex = uint(index);
             
             uint nextSourceIndex = sourceIndex + 1;
             targetIndex = 2;
             while(targetIndex <= targetLength) {
                 
                 string memory charToFind=charAt(findString, targetIndex);
                 string memory nextSourceChar = charAt(source, nextSourceIndex);
          
                 if (!(charToFind.compareTo(nextSourceChar))){
                
                     break;
                 }
                 if(targetIndex == targetLength) {
                     return int(sourceIndex);
                 } else {
                    nextSourceIndex += 1;
                    targetIndex++;
                 }
             }
             sourceIndex +=1;   
         }
         return -1;
    }
