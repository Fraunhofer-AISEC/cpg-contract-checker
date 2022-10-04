  struct Campaign {
    address payable campAddress;
    uint goal;
    uint deadline;
    string title;
    uint zipcode;
    Project projAddress;

}

Campaign public campInfo;
Project public projectAddress;

mapping(address => Campaign) public campaignInfo;

   constructor(uint _goal, uint _deadline, string memory _title, uint _zipcode, Project _projAddress) public payable {
   projectAddress = _projAddress;
    campInfo = Campaign(
        msg.sender,
        _goal,
        _deadline,
        _title,
        _zipcode,
        projectAddress
        );  
    campaignInfo[msg.sender] = campInfo;
}
function getCampaign() view public returns(
   address,
    uint ,
    uint  ,
    string memory ,
    uint,
    Project
    ){
    return(
        campInfo.campAddress,
        campInfo.goal,
         campInfo.deadline,
        campInfo.title,
        campInfo.zipcode,
        campInfo.projAddress
        );
}
