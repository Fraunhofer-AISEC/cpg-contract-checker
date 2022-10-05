contract parent{   
  
    function getValue( 
    ) public view virtual returns(uint) {   
        return 10;   
    }   
}   
  
contract child is parent{   
      
    function getValue( 
    ) public view override returns(uint) {   
        return 15;   
    }   
}   
    
contract child_2 is parent{   
      
    function getValue( 
    ) public view override returns(uint) {   
        return 20;   
    }   
}   
  
contract ContractPolymorphism {   
    function getChildValue(address adr) public view returns(uint){
        return child(adr).getValue();
    }
    function getChild2Value(address adr) public view returns(uint){
        return child_2(adr).getValue();
    }
}
