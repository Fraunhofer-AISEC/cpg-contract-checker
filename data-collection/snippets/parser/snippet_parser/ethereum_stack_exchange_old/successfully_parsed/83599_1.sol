pragma solidity ^0.5.16;
contract Users {

    enum UserType{
        Producer,
        Manufacturer,
        Supplier,
        Retailer,
        Consumer
    }

    modifier onlyManufacturer(address _owner){
        require (isManufacturer(_owner), "Only Manufacturer's are allowed to access this function");
        _;
    }

function isManufacturer(address _userAddress) public view returns(bool){
        UserType temp = UserType.Manufacturer;
        if(users[_userAddress].userType == temp){
            return true;
        }else{
            return false;
        }
    }
}