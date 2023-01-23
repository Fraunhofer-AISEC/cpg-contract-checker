contract Test {   
     uint8[] public arr_0 = new uint8[](4);
     uint8[] public arr_1 = [0,0,0,0];
     uint8[] public arr_2;
 
     function pushItem(uint8 x) public {
         arr_0.push(x);
         arr_1.push(x);
         arr_2.push(x);
     }
 
     function popItem() public {
         arr_0.pop();
         arr_1.pop();
         arr_2.pop();
     }
 
     function g() public {
         uint8[] memory x = new uint8[](2);
         
         arr_0 = x;
         arr_1 = x;
         arr_2 = x;
        
     }    
}
