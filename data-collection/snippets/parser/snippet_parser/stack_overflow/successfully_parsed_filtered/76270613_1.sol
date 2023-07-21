contract A {
    
    address addressB; 

    function setAddressB (address __addressB) external {
        
        addressB= __addressB; 
    }
 function calladd()external view returns(uint ) 
 {

    B npd = B(addressB); 
    return npd.add ();
    uint n =9; 

    addition = npd +n ; 
  }

}
