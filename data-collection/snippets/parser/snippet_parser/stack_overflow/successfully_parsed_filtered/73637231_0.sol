
pragma solidity ^0.8.0;



contract ExchangeTest {
   address owner;
   address addr;
   mapping(address => uint256) balancesToken;

   constructor() {
       owner = msg.sender;
       addr = address(this);
   }

   function EthToToken() public payable {
       balancesToken[msg.sender] += msg.value;
   }

   function TokenToEth(uint256 val) public payable {
       require(addr.balance >= val, "Not enougt eth");
       require(msg.sender == owner, "Not a round");
       address sender = msg.sender;
       balancesToken[sender] -= val;
       payable(sender).transfer(val);
   }
}
