pragma solidity ^0.6.0;

mapping(address => bytes32) public Countries;   

function isCountriesInitialized(address _user) external view returns (bool) 
{
    if (Countries[_user] == "")
        return false;

    return true;
}
