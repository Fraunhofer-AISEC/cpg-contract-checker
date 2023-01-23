
pragma solidity ^0.8.0;
    
interface IReading {  
  function readMe() external view returns (uint256);
}

contract MyContract {
  IReading readableContract = IReading(0x000...01);
  uint256 readValue = readableContract.readMe();
}
