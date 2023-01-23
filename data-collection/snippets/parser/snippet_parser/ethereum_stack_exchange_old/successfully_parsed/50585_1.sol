
pragma solidity >=0.7.0 <0.9.0;

contract ContractName{
    uint public count=0;
    struct Thedata{
        uint id;
        uint customer_ref_2;
        string warehouse_name;
        uint location;
    }

    mapping(uint=>Thedata) public thedata;

    function createThedata(uint _customer_ref_2,string memory _warehouse_name,uint _location) public{
        thedata[count]=Thedata(count, _customer_ref_2, _warehouse_name, _location);    
        count ++;   
    }
}
