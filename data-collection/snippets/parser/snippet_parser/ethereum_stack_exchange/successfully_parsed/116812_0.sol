import "@openzeppelin/contracts/utils/Address.sol";

contract A {

using Address for address payable;

 function proxyCallWithValue(address payable target, bytes memory callData, uint256 value)
 external
 payable {
     target.functionCallWithValue(callData, value);
 }
}
