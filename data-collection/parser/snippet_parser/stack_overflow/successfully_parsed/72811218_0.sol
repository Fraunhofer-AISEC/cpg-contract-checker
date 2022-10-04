pragma solidity ^0.8.7;
import "../Simplestorage.sol";
contract storagefactoryy{
    Simplestorage public anyname;

    function createstorage() public{
        anyname = new simplestorage();
    }

  



}
