contract Test {

   mapping (bytes32 => mapping(uint => uint)) public map;

   function increase(bytes32 id,uint index) public {        
       map[id][index] = map[id][index] + 1;
   }

}
