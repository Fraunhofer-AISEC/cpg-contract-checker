  function get2First() public view returns (uint) { 
    
    uint a = 123456789;
    uint b = a / 10000000;       
    return  b ;
}



function get2second() public view returns (uint) {
    
    uint a = 123456789;
    uint b = a / 100000;
    uint c = b % 100;
    return  c ;
}
