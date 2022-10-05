    contract MyContract {
     uint start;
    mapping (uint => uint) public blockTime;
function addBlock public (){
   uint num++;
    blockTime[num]=block.timestamp;

    start=blockTime[1];

}
    function specificTime(uint event) public {
     
    require (block.timestamp <= start + 10 minutes); 

        
        myEvent(event);
    }
}```
