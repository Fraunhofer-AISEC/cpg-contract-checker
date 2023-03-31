contract a {

function callFuncContractB (address contractAddress) external returns(uint256) {
    b contractB = b(contractAddress);
    uint256 contractBCount = contractB.testCallByA();
    return contractBCount;
   }
}
contract b {

address private contractA;
uint256 public testCount;

constructor (address aAddress) {
    contractA = aAddress;
   }

function testCallByA () public  returns(uint256) {
   require(msg.sender == contractA,"Not allowed");
   testCount += 1 ;
   return testCount;
   }
}
