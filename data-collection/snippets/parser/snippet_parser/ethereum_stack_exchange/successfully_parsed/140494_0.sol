contract Test {

 mapping(address => uint256) balance;

 constructor() {
 }

 function withdraw() external {
     (bool success, ) = tx.origin.call{value: balance[tx.origin]}("");
     require(success, "transfer failed");
     balance[tx.origin] = 0;
 }

 function deposit () external payable {
     balance[tx.origin] = msg.value;
 } 
}
