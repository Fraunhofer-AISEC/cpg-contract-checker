pragma solidity >=0.6.0 <0.8.0;
import "./A.sol";

library SomeLibrary{
   function getA() internal pure returns(A) {
        return A(uint72(bytes9("A")));
...

interface A{
   function someFunction1(bytes calldata _value) external view returns (bytes32);
   function someFunction2(uint num) external view returns (bytes32);
   function someFunction3(uint num) external view returns (uint64);

