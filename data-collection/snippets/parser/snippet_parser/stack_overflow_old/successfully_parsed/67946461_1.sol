
pragma solidity >=0.7.0 <0.9.0;
contract Test{
    uint timeBro=block.timestamp;
    uint functionCallTime;
    function FunTime() public returns(uint){
      functionCallTime=block.timestamp;
      return block.timestamp;
    }
}
