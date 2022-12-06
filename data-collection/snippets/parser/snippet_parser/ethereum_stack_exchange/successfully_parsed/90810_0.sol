

pragma solidity >=0.5.16;

contract MyContract {

 string public functionCalled;

 function sendEther () external payable {
     functionCalled = 'sendEther';
 }
 fallback () external payable {
     functionCalled = 'fallback';
 }
}
