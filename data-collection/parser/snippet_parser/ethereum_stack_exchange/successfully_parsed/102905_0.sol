contract parent{ 

    uint private _num = 1; 
       
    function num() public view virtual returns (uint) {
        return _num;
    }
} 
 
contract child is parent{ 
      
    uint private _num = 0; 

    
    function num() public view override returns (uint) {
        return _num;
    }
} 
