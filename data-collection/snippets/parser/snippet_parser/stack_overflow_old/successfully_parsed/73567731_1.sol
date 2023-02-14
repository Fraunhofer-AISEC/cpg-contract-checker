pragma solidity^0.8.1;
import './firstContract.sol';
contract Second{
address _firstContract;
constructor(address _prev){
    _firstContract=_prev;
}
function setData()public view{
    FirstContract h=FirstContract(_firstContract);
    h.returnDoubleValue(22); 
}
}
