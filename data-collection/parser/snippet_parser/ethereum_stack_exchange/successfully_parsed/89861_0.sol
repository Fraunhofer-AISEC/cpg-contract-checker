mapping(address=>bool) RegisteredOracles;
mapping(uint=>uint)ID_Timesatmp;

 function ReturnContactTracingList(uint ID, uint timestamp) public{
    require(RegisteredOracles[msg.sender]);  
   
    require (ID_Timesatmp[ID] == timestamp);
    
}
