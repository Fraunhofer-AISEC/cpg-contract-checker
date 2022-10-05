Contract2 {
    Contract1 public con; 
    
    function callMap(address adr) public {
        uint i = con.map(adr) 
    }
}
