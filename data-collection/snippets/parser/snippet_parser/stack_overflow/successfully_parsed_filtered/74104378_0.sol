pragma solidity >=0.8.7;
contract Counter {
uint256 count = 0;

function counter(uint256 number) external returns(uint256){
count = count + number;
return count;
}
}
