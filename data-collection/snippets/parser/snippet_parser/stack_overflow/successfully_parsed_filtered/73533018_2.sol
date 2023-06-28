
pragma solidity >=0.7.0 <0.9.0;

contract Answer
{
    mapping(address => uint) public StorageMap; 

    function InsertToStorage(address name, uint favoritenumber) public 
    {
        StorageMap[name] = favoritenumber;
    }

    function GetFavoriteNumber(address name) public view returns(uint) 
    {
        return StorageMap[name];
    }
}
