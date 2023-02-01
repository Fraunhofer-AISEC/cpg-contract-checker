strings.slice memory s = result.toSlice();                
        strings.slice memory delim = ",".toSlice();                            
        string[] memory parts = new string[](s.count(delim) + 1);                  
        for (uint i = 0; i < parts.length; i++) {                              
           parts[i] = s.split(delim).toString();                              
        } 
