pragma solidity >=0.7.0 <0.9.0;

contract Factory {
    mapping(address => Campaign) _campaigns;

    function createCampaign(uint minContrib) public {
        require(_campaigns[msg.sender] == Campaign(0));
        _campaigns[msg.sender] = new Campaign(minContrib, msg.sender);
    }
 }


...


contract Campaign {
 
    

    constructor (uint minContrib, address creator) {
        manager = creator;
        minContribution = minContrib;
    }
