contract FinishedGoodManager{

struct FinishedGood{
string ProductionManagerId;
string ProductId;
string SerialNum;
string RMArray;
} 


FinishedGood[] finishedGoods;

    enum ErrorCodes {
    NULL,
    SUCCESS,
    ERROR,
    NOT_FOUND,
    EXISTS,
    RECURSIVE,
    INSUFFICIENT_BALANCE
}



  mapping (string => uint) serialNumberToIdMap;



function stringToBytes32(string memory source) returns (bytes32 result) {
      assembly {
          result := mload(add(source, 32))
      }
  }

   function b32(string memory source) constant returns (bytes32) {
    return stringToBytes32(source);
  }

  function FinishedGoodManager() {
    finishedGoods.length = 1; 
  }

  function getFinishedGood(string serialNum) constant returns (string,string,string,string) {
    uint finishedGoodRowId = serialNumberToIdMap[serialNum];
    return (finishedGoods[finishedGoodRowId].ProductionManagerId,finishedGoods[finishedGoodRowId].ProductId,finishedGoods[finishedGoodRowId].SerialNum,finishedGoods[finishedGoodRowId].RMArray);
  }


   function exists(string serialNum) constant returns (bool) {
    return serialNumberToIdMap[serialNum] != 0;
  }


  function createFinishedGood(string productionManagerId,string productId,string serialNum,string rmArr) constant returns(string,uint){

     
    if (bytes(serialNum).length > 32) return ("ERROR",0);
    
    if (exists(serialNum)) return ("EXISTS",1);


    
    uint index = finishedGoods.length+1;

    serialNumberToIdMap[serialNum] = index;

    finishedGoods.push(FinishedGood(
     productionManagerId,
     productId,
     serialNum,
     rmArr
    ));   

    return (finishedGoods[0].SerialNum,finishedGoods.length);
  }


}
