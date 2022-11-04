    int  x; 
    mapping (uint => uint)  y; 
    uint []  z; 
  
    function element() public  returns (uint a, uint b, uint c) {
      z.push(45);
      assembly {
          c:=mload(0)
      }
      
    }
