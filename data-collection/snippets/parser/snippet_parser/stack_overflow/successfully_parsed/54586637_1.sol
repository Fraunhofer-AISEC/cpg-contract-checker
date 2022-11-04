pragma solidity 0.5.0;

contract Trades {
  struct Trade {
    string secId;
    uint notional;
    uint price;
    string client;
    uint version;
    uint index;       
    uint  tradeId;
  }

mapping(uint =>mapping(uint => Trade)) public trades;

uint public tradeId;
uint[] tradeIndex;
uint[] tradeID;
uint[] public totalNum;

function updateTrade(uint _tradeId, string memory _secId,uint _notional,uint _price,string memory _client) public{

    uint j;
    j= (getLatestVersionOfTrade(_tradeId)) + 1;
    trades[_tradeId][j].secId = _secId;
    trades[_tradeId][j].notional = _notional;
    trades[_tradeId][j].price = _price;
    trades[_tradeId][j].client = _client;
    trades[_tradeId][j].version = j;
    trades[_tradeId][j].index = tradeIndex.push(tradeIndex[tradeIndex.length-1]+1);
}

function setTrade(string memory _secId,uint _notional,uint _price,string memory _client) public {

    uint  version  = 0;
    tradeId++;

    trades[tradeId][version].secId = _secId;
    trades[tradeId][version].notional = _notional;
    trades[tradeId][version].price = _price;
    trades[tradeId][version].client = _client;
    trades[tradeId][version].version = version;
    trades[tradeId][version].index = tradeIndex.push(tradeId);
    tradeID.push(tradeId);
}

function getAllTradeData()view public returns(uint[] memory){
    return tradeIndex;
}

function getAllTradeDataId()view public returns(uint[] memory){
    return tradeID;
}

function getTradeById(uint _tradeId,uint version)view public returns(string memory, uint, uint, string memory, uint, uint){
    return (trades[_tradeId][version].secId, trades[_tradeId][version].notional, trades[_tradeId][version].price,
    trades[_tradeId][version].client,trades[_tradeId][version].version, trades[_tradeId][version].index);
}

   function getLatestVersionOfTrade(uint _tradeId) view public returns (uint) {
    uint max = 0;

    for (uint i = 0; i < tradeIndex.length; i++) {
        uint ver = trades[_tradeId][i].version;
        if (ver > max) {
            max = ver;
        }
    }
return max;
}

function getClientData(string memory _client) public returns (uint[] memory) {  

    if (totalNum.length > 0){
        delete totalNum;
    }
        for(uint i=1; i <= tradeID.length;i++){
        uint j;
        j= (getLatestVersionOfTrade(i));
        if(uint(keccak256(abi.encodePacked(trades[i][j].client))) == uint(keccak256(abi.encodePacked(_client)))){
            totalNum.push(i);
        }             
    }  
    return totalNum;
}

function getTotalNumLength() public returns (uint){
    return totalNum.length;
}
}
