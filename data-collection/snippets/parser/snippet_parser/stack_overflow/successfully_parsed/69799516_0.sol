pragma solidity 0.8.7;

contract Contract1{
  uint[] newData ;
  
  constructor(uint _i){
      newData.push(_i);
  }
 }

interface IContract1 {
    function newData() external returns(uint[] memory);
}

contract Contract2 {
    uint public newOne;
    function foo(address _addr, uint _i) external{
        newOne = IContract1(_addr).newData()[_i];
    }
}
