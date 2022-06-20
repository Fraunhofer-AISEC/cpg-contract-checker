pragma solidity 0.5.16;

contract receive{
function dep() external payable{
    
    }
}
function fallback() external payable{}

pragma solidity 0.5.16;

import "./receive.sol";

contract send {
    receive rc = receive (address(0x0DCd2F752394c41875e259e00bb44fd505297caF)); 
    function snd(uint256 amount) public payable {
        rc.dep.transfer(amount);
    }
    function fallback() external payable{}
}
