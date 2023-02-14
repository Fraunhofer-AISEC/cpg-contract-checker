pragma solidity ^0.5.0;

import './oracle.sol';

contract Aggregator{

   mapping(address => address[]) public contractsOwned;
   mapping(address => address[]) public contractsTaken;
   mapping(address => bool) public contractExists;
   
   function createOracle(
      string memory dtype, 
      string memory dformat, 
      uint cost,
      uint cycle
   ) public returns(bool success){
      address s = address(new Oracle(
         address(uint160(address(this))),
         dtype,
         dformat,
         cost,
         cycle
      ));
      contractsOwned[msg.sender].push(s);
      contractExists[s] = true;
      return true;
   }

   function getTakenLength() public view returns(uint length){
      return contractsTaken[msg.sender].length;
   }
   function getOwnedLength() public view returns(uint length){
      return contractsOwned[msg.sender].length;
   }
   function getContractTaken(uint index) public view returns(address taken){
      if(contractsTaken[msg.sender].length <= index)
         return address(0);
      return contractsTaken[msg.sender][index];
   }
   function getContractOwned(uint index) public view returns(address owned){
      if(contractsOwned[msg.sender].length <= index)
         return address(0);
      return contractsOwned[msg.sender][index];
   }
   
   
   function takeContract(address payable oracle) public returns(bool success){
      Oracle o; 
      if(!contractExists[oracle])
         return false;
      if(!ownsContract(msg.sender, oracle))
         return false; 
      o = Oracle(oracle);
      contractsTaken[msg.sender].push(oracle);
      return o.takeContract();
   }
   function updateContract(address payable oracle, string memory data) public returns(bool success){
      Oracle o;
      if(!contractExists[oracle])
         return false;
      if(!ownsContract(msg.sender, oracle))
         return false;
      o = Oracle(oracle);
      return o.update(data);
   }
   function requestContract(address payable oracle) public returns(bool success){
      Oracle o;
      if(!contractExists[oracle])
         return false;
      if(!takenContract(msg.sender, oracle))
         return false;
      o = Oracle(oracle);
      return o.request();
   }
   function endSell(address payable oracle) public returns(bool success){
      Oracle o;
      if(!contractExists[oracle])
         return false;
      if(!ownsContract(msg.sender, oracle))
         return false;
      o = Oracle(oracle);
      if(!o.endSell())
         return false;
      contractExists[oracle] = false;
      
   }
   function endBuy(address payable oracle) public returns(bool success){
      Oracle o;
      if(!contractExists[oracle])
         return false;
      if(!takenContract(msg.sender, oracle))
         return false;
      o = Oracle(oracle);
      if(!o.endSell())
         return false;
      contractExists[oracle] = false;
      
   }

   
   function setType(address payable oracle, string memory dtype) public returns (bool success){
      Oracle o;
      if(!contractExists[oracle])
         return false;
      if(!ownsContract(msg.sender, oracle))
         return false;
      o = Oracle(oracle);
      return o.setType(dtype);
   }
   function setFormat(address payable oracle, string memory format) public returns (bool success){
      Oracle o;
      if(!contractExists[oracle])
         return false;
      if(!ownsContract(msg.sender, oracle))
         return false;
      o = Oracle(oracle);
      return o.setFormat(format);
   }
   function setCycle(address payable oracle, uint cycle) public returns(bool success){
      Oracle o;
      if(!contractExists[oracle])
         return false;
      if(!ownsContract(msg.sender, oracle))
         return false;
      o = Oracle(oracle);
      return o.setCycle(cycle);
   }
   function setCost(address payable oracle, uint cost) public returns(bool success){
      Oracle o;
      if(!contractExists[oracle])
         return false;
      if(!ownsContract(msg.sender, oracle))
         return false;
      o = Oracle(oracle);
      return o.setCost(cost);
   }
   
   
   function removeContractTaken(address payable oracle) internal returns(bool success){
      uint length = contractsTaken[msg.sender].length;
      uint i = 0;
      if(length <= 0)
         return false;
      for(i = 0; i < length; ++i){
         if(contractsTaken[msg.sender][i] == oracle){
            if(i != length - 1)
               contractsTaken[msg.sender][i] = contractsTaken[msg.sender][length - 1];
            delete contractsTaken[msg.sender][length - 1];
            return true;
         }
      }
      return false;
   }
   function removeContractOwned(address payable oracle) internal returns(bool success){
      uint length = contractsOwned[msg.sender].length;
      uint i = 0;
      if(length <= 0)
         return false;
      for(i = 0; i < length; ++i){
         if(contractsOwned[msg.sender][i] == oracle){
            if(i != length - 1)
               contractsOwned[msg.sender][i] = contractsOwned[msg.sender][length - 1];
            delete contractsOwned[msg.sender][length - 1];
            return true;

         }
      }
      return false;
   }
   function takenContract(address buyer, address oracle) internal view returns(bool success){
      uint length = contractsTaken[buyer].length;
      uint i = 0;
      if(contractsTaken[buyer].length <= 0)
         return false;
      for(i = 0; i < length; ++i){
         if(contractsTaken[buyer][i] == oracle)
            return true;
      }
      return false;
   }
   function ownsContract(address owner, address oracle) internal view returns(bool success){
      uint length = contractsOwned[owner].length;
      uint i = 0;
      if(contractsOwned[owner].length <= 0)
         return false;
      for(i = 0; i < length; ++i){
         if(contractsOwned[owner][i] == oracle)
            return true;
      }
      return false;
   }
}
