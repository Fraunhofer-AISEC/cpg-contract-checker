pragma solidity ^0.4.17;
import "./StorageContract.sol";

contract PersonalInfo{

    address storageContractAddr = "Here goes your StorageContract address already deployed";

    function PersonalInfo(string Name, string Email) public{
        StorageContract s = StorageContract(storageContractAddr);
        s.savePersonalInfo(Name, Email, this);
    }
}
