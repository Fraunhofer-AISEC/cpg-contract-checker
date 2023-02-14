    
    pragma solidity ^0.8.0;
    
    import "./Testing.sol";
    
    contract TestingFactory {
       Testing[] public TestingArray;
       address public origin;
    
       function CreateNewContract(string memory _title, string memory _unitName) public {
         origin = address(tx.origin);
         Testing test = new Testing(_title, _unitName, address(origin));
         TestingArray.push(test);
         setterOwner(0,origin);
       }
    
        function setterOwner(uint256 _testingIndex, address _creator) public {
         Testing(address(TestingArray[_testingIndex])).transferOwnership(_creator);
       }
    }
