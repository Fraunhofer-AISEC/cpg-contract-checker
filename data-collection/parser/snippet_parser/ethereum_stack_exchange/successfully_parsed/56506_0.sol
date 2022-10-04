pragma solidity ^0.4.7;

contract ContractTest {
    bytes32 public Name;

    function ContractTest (bytes32 name) {
        Name = name;
    }
}


pragma solidity ^0.4.7;
import './ContractTest.sol';

contract FactoryTest{
    address[2] newContracts;

    function createContract (bytes32 name) {
        address newContract = new ContractTest(name);
        newContracts[0]=newContract;
    }
        function getContract() returns(address) {
          return newContracts[0];
        }
}
