pragma solidity 0.4.19;

contract A{

    event debug(bool destroyed);

    function destroyMeAndLog() onlyOwner{
        debug(true);
        selfdestruct(this);


    }
}
