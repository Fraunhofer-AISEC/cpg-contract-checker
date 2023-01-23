pragma solidity ^0.4.8;

contract MyCoin {

    function MyCoin(address _finalDestination, uint _contractGracePeriod, address _parentContract) 
    {
        if(_parentContract == address(0))
        {
            hupCount = 0; 
        }
        else
        {
            throw;
        }
    }
}
