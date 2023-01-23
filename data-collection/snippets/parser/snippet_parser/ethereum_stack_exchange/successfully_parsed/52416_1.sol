pragma solidity 0.4.24;

contract Test
{

mapping (address => Account) public Accounts;

struct Account {
    address id;
    string company;
    string country;
    string industry;
    bool active;
}


modifier validAccount(address _accountId) {
    require (Accounts[msg.sender].active);
    _;
}

function Add(address _id, string _company, string _country, string _industry,bool _active)
{
    Account memory  acc = Account(_id,_company,_country,_industry,_active);
    Accounts[_id] = acc;
}

function GetCompany(address _id) onlyValid(_id) public constant returns(string)
{
    return Accounts[_id].company;
}

modifier onlyValid(address _id)
{
    require (Accounts[_id].active);
    _;
}

modifier onlyValidSender()
{
    require(Accounts[msg.sender].active);
    _;
}

function GetCountry(address _id) onlyValidSender public view returns(string)
{
        return Accounts[_id].company;

}

}
