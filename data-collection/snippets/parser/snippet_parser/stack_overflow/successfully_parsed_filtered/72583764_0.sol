
pragma solidity 0.8.4; 
contract Example{
    function test (uint x) external pure returns(bool z) {
        if(x > 0)
          z=true;
        else
          z=false;
    }
}
