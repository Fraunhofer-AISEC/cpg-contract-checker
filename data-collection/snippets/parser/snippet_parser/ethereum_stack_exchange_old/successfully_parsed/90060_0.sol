function splitString(string calldata stringToSplit) external pure returns(string memory) {
    
    
    string[] memory finalWordsArray;
    
    
    uint256 wordCounter = 0;

    
    
    bytes memory stringAsBytesArray = bytes(stringToSplit);

    
    
    string memory tmp = new string(stringAsBytesArray.length);
    bytes memory tempWord = bytes(tmp);
    
    
    
    
    for(uint i = 0; i < stringAsBytesArray.length; i++) {
        
        if (stringAsBytesArray[i] != ",") {
            tempWord[i] = stringAsBytesArray[i];
        }
        else {
            
            
            string memory newWord = string(tempWord);
            
            
            
            
            
            
             wordCounter++;
             
            
            tempWord = bytes(tmp);
            

            
            
            
            return newWord;
        }
    }

    return "no Commas found!!!";

    
}
