pragma solidity 0.8.6;
import "./Child.sol";

contract ChildrenFactory {
      
      Child[] public children;
      address[] public childrenAddresses;

    event ChildCreated(address newChild);

      function createChild(uint age) public {
         Child child = new Child(age);
         emit ChildCreated(address(child));
         children.push(child);
         childrenAddresses.push(address(child));
      }
}
