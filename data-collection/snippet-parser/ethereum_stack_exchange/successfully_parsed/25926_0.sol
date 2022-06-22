contract demo {
   string public name = "some32bitString";
   function returnValue() constant returns (string){
      return name; 
   } 
}
