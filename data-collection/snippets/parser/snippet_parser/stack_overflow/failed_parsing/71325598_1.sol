     do { 
         emit Transfer(address(0), to, updatedIndex++); 
     } while (updatedIndex != end); 
 } 
 _currentIndex = updatedIndex; 
