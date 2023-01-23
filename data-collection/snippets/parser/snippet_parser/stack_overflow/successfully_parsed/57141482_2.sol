pragma solidity >=0.4.0 <0.6.0;
import "remix_tests.sol"; 
import "./TestProxy.sol";
import "./ContractA.sol";


contract TestContractA {
  function testAdd() public {
    ContractA conA = new ContractA(1);
    TestProxy tp = new TestProxy(address(conA));        
    ContractA(address(tp)).add(0);        
    (bool r,) = tp.execute.gas(20000)();
    Assert.equal(r, false, "the call should fail");
}
}