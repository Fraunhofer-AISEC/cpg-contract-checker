pragma solidity ^0.4.18;

contract property {

uint256 cad_number;
address customer;

struct propertyInfo{
    address Owneradress;
    uint256 cad_number;
    string location;
    uint32 cost;
    bool housing_status;
}

mapping(uint256 => propertyInfo) propertys;
mapping (address => uint) public balances;

    function Create_Property(address Owneradress,
                             string memory location, 
                             uint32 cost, 
                             bool housing_status
                            ) public{
        propertyInfo storage NewProperty = propertys[cad_number];
        NewProperty.Owneradress = address(Owneradress);
        NewProperty.location = location;
        NewProperty.cost = cost;
        NewProperty.cad_number = cad_number;
        NewProperty.housing_status = housing_status;
        cad_number++;
    }

    function Listing_property(uint256 prop_id) public view returns (
                                                                     address, 
                                                                     string memory,
                                                                     uint256, 
                                                                     uint32,
                                                                     bool
                                                                   ){
        propertyInfo storage s = propertys[prop_id];
        return(s.Owneradress, s.location, s.cad_number, s.cost, s.housing_status);
    }

    function transaction_to_contract(uint256 _id) public payable {
        propertyInfo storage s = propertys[_id];
        s.Owneradress.transfer(s.cost);
        balances[s.Owneradress] += s.cost;
    }
} 
