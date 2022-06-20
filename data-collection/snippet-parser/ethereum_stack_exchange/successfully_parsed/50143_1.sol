pragma solidity ^0.4.23;

contract ContractX {
    struct Customer {
        string name;
        string license;
        
    }

    mapping (address => uint) addressIndexes;
    mapping (string => uint) licenseIndexes;
    Customer[] customers;
    uint customerCount;

    function addNewItem(address _address, string _name, string _license) public {
        customers.push(Customer(_name, _license));

        addressIndexes[_address] = customerCount;
        licenseIndexes[_license] = customerCount;

        customerCount++;
    }

    function getByAddress(address _address) public view returns(string, string) {
        return (
            customers[addressIndexes[_address]].name, 
            customers[addressIndexes[_address]].license
        );
    }

    function getByLicense(string _license) public view returns(string, string) {
        return (
            customers[licenseIndexes[_license]].name, 
            customers[licenseIndexes[_license]].license
        );
    }
}
