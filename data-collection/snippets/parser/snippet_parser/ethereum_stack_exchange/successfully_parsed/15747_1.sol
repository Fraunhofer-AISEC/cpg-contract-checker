contract Timestamp {
   uint start;
   uint end;
   function start(){
      start = block.timestamp;
   } 
   function end(){
      end = block.timestamp;
   } 
   function getTimeDif() returns(uint){
      return end - start;
   }     
}
