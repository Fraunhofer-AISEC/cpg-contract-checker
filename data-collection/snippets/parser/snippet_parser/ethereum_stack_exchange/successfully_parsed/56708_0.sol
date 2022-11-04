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

    function approve(address Org) Owner public
    {
        applicants[Org].approved = true;
    }   
}
