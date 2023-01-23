
import 'Company.sol';

contract Creator {

    string[] public names;
    address[] public companies;

    
    function createCompany(string _companyName, uint _noOfShares, uint _pricePerShare, address _creator) returns(address) {
        address newCompany = new Company(_companyName, _noOfShares, _pricePerShare, _creator);
        names.push(_companyName);
        companies.push(newCompany);
        return newCompany;
    }

    
    function getName(uint i) constant returns(string companyName) {
        return names[i];
    }
    
    function getAddress(uint i) constant returns(address companyAddress) {
        return companies[i];
    }

    
    function getLastAddress() constant returns(address companyAddress) {
        return companies[companies.length - 1];
    }

}
