pragma solidity ^0.4.19;

contract Owned {

address owner;

function Owned() public {
    owner = msg.sender;
}

modifier onlyOwner() {
    require(msg.sender == owner);
    _;
}
}


contract Rent is Owned {    
struct Person {

    address eth;
    string legalName;
    string email;
    uint aadhaar;

    string signTerms; 

    uint[] myOwned;
    uint[] myRented;
}

struct Parties {

    address landlord;
    address tenant;

    string signLandlord;
    string signTenant;

    bool completed;
}


struct House {

    string addressHouse;
    string type_of_property;

    uint startEpoch;
    uint endEpoch; 

    uint monthDuration; 

    uint rentAmount;
    uint securityFee;
    uint registerFee;

    bool completed;
}

struct OtherDetails {

    string latitude;
    string longitude;

    string ipfs_url; 

    uint squareFootage;
    uint numberBedrooms;
    string others;

    bool completed;
}

struct Checks {

    bool isValid;

    bool tenantApprove;
    bool govApprove;

    bool tenantCheck;

    bool paidRegisterFee;
    bool paidSecurityFee;
}

Parties[] public allParties; 
House[] public allHouses;
OtherDetails[] public allOtherDetails;
Checks[] private allChecks;

mapping(address => Person) public addressToPerson;
mapping(address => bool) private checkUser;
mapping(uint => bool) private checkAadhaar;

mapping(address => uint) private registerFeeMap;
mapping(address => uint) private securityFeeMap;


function Rent() public {

    checkUser[owner] = true;
    var govt = Person(owner, 'Owner', 'Owner', 0, 'No Sign', new uint[](0), new uint[](0));

    addressToPerson[owner] = govt;
}


event registerParty(string message);

function registerParties(address _tenant) external  {

    require(msg.sender != _tenant);

    if(checkUser[msg.sender] == true)
    {
        if(checkUser[_tenant] == true)
        {
            var newParty = Parties(msg.sender, _tenant,'N/A', 'N/A', true);
            var index = allParties.push(newParty) - 1;

            var newHouse = House('No Address Added', 'No Property Type', 0, 0, 0, 0, 0, 0, false);
            allHouses.push(newHouse);

            var newDetails = OtherDetails('28.7041', '77.1025', 'Currently IPFS Not Supported', 0, 0, 'N/A', false);
            allOtherDetails.push(newDetails);

            var newChecks = Checks(false, false, false, false, false, false);
            allChecks.push(newChecks);

            var user = addressToPerson[msg.sender];
            user.myOwned.push(index);

            var tenant = addressToPerson[_tenant];
            tenant.myRented.push(index);

            registerParty('Tenant was Successfully added to Contract, Proceed to Step 2');
        }

        else
        {
            registerParty('Tenant is not registered on Charter, registration of both parties is required');
        }
    }

    else
    {
        registerParty('Kindly register on Charter, before drafting a Contract');
    }
}


event registerHome(string message, uint FeePayable);

function newHome(string _add, string _type, uint _startEpoch, uint _endEpoch, uint _months, uint _rent, uint _security) external {

    if(checkUser[msg.sender] == true)
    {
        var user = addressToPerson[msg.sender];

        uint num = user.myOwned.length - 1;

        if(num < 0)
        {
            registerHome('Kindly fill Tenant Info in Step 1 before proceeding to Step 2', 0);
        }

        else
        {
            uint index = user.myOwned[num];
            var houseOwner = allParties[index];

            if(houseOwner.landlord != msg.sender)
            {
                registerHome('Kindly register on Charter, before drafting a Contract', 0);
            }

            else
            {
                var home = allHouses[index];

                if(home.completed == false)
                {
                    home.addressHouse = _add;
                    home.type_of_property = _type;

                    home.startEpoch = _startEpoch;
                    home.endEpoch = _endEpoch;

                    home.monthDuration = _months;

                    home.rentAmount = _rent;
                    home.securityFee = _security;

                    var _tenant = allParties[index].tenant; 

                    if((home.monthDuration < 12)&&(home.monthDuration > 0))
                    {
                        home.registerFee = 100;
                        home.completed = true;

                        registerHome("Property's Information successfully entered, Proceed to Step-3", home.registerFee);
                    }

                    else if(home.monthDuration <= 60)
                    {
                        if(_security > 0)
                        home.registerFee = 100 + ((2 * 12 * _rent) / 100) + 1100;

                        else
                        home.registerFee = ((2 * 12 * _rent) / 100) + 1100;

                        home.completed = true;

                        registerHome("Property's Information successfully entered, Proceed to Step-3", home.registerFee);
                    }

                    else if(home.monthDuration <= 120)
                    {
                        if(_security > 0)
                        home.registerFee = 100 + ((3 * 12 * _rent) / 100) + 1100;

                        else
                        home.registerFee = ((3 * 12 * _rent) / 100) + 1100;     

                        home.completed = true;

                        registerHome("Property's Information successfully entered, Proceed to Step-3", home.registerFee);       
                    }

                    else if(home.monthDuration <= 240)
                    {
                        if(_security > 0)
                        home.registerFee = 100 + ((6 * 12 * _rent) / 100) + 1100;

                        else
                        home.registerFee = ((6 * 12 * _rent) / 100) + 1100;

                        home.completed = true;
                        registerHome("Property's Information successfully entered, Proceed to Step-3", home.registerFee);
                    }

                    else
                    {
                        home.completed = false;
                        registerHome('Kindly Enter Duration of Contract Correctly.. (Min - 1 month, Max - 240 Months' , 0);
                    }
                }

                else
                {
                    registerHome('Home Registration is already Completed ', 0);
                }

                registerFeeMap[msg.sender] = home.registerFee;
                securityFeeMap[_tenant] = home.securityFee;
            }

        }
    }

    else
    {
        registerHome('Kindly register on Charter, before drafting a Contract', 0);
    }
}



event feePay(string message);

function feePayment(string _sign, uint _currentRate) external payable {

    require(msg.value == (registerFeeMap[msg.sender] * 10**18 / _currentRate));

    if(checkUser[msg.sender] == true)
    {
        var user = addressToPerson[msg.sender];

        uint num = user.myOwned.length - 1;

        if(num < 0)
        {
            feePay('Complete all the Steps, before paying Registration Fee Payment');
        }

        else
        {

            uint index = user.myOwned[num];
            var party = allParties[index];
            var house = allHouses[index];
            var details = allOtherDetails[index];
            var checks = allChecks[index];

            if((details.completed == true)&&(house.completed == true)&&(party.completed == true))
            {
                user = addressToPerson[msg.sender];
                checks.paidRegisterFee = true;
                party.signLandlord = _sign;

                feePay('Government Registration Fee Payment Successful, Tenant Verification pending..');
            }

            else 
            {
                feePay('Complete all the Steps given above before Fee Payment');
            }
        }
    }

    else
    {
        feePay('Kindly register on Charter, before drafting a Contract');
    }
}
}
