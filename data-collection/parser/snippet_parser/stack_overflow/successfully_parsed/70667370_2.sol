import "./Dtoken.sol";

contract MasterDAO {

uint proposalNum;

mapping (address => Member) public members;
mapping (uint => Proposal) public proposals;
mapping (uint => SubDAO) public subDAOs;


function createSubDAO (uint _poolGap, uint _DAOID, uint _rate, Dtoken _token) public returns (address daoAddress) {
    SubDAO subDAO = new SubDAO(_poolGap, _DAOID, msg.sender, _rate, this, _token);
    daoAddress = address(subDAO);
}} 
