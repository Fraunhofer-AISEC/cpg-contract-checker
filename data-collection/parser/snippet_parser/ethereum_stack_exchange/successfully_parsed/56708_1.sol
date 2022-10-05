pragma solidity ^0.4.24;

contract DonationContract
{
    address owner;

    struct Applicant
    {
        address Appl;
        string Name;
        string OrgType;
        string Number;
        string Email;
        uint256 Funds; 
        bool approved;
    }

    mapping(address => bool) facilitators;

    mapping (address => Applicant) applicants;

    modifier Owner() 
    {
        require(msg.sender == owner);
        _;
    }

     modifier Approved() 
    {
        require(applicants[msg.sender].approved == true);
        _;
    }

    modifier OnlyFacilitator()
    {
        require(facilitators[msg.sender] == true);
        _;
    }

    constructor() public {
        owner = msg.sender;
        facilitators[msg.sender] = true;
    }

    function approve(address Org) OnlyFacilitator public
    {
        applicants[Org].approved = true;
    }   

    function addFacilitator(address _addr) Owner public
    {
        facilitators[_addr] = true;
    }
}
