pragma solidity >=0.5.0 <0.7.0;
contract Example{
    uint256[3] x;
    function setArr(uint256[3] memory y) public returns(uint256[3] memory){
        x=y;
       return getArr(x);
    }
    function getArr(uint256[3] storage z) internal pure returns(uint256[3] memory)
    {  return z;
    }
}
