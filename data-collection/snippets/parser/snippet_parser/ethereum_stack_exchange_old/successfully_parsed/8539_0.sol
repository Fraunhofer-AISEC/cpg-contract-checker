contract MyContract {
struct Posposal{
    uint posposalId;
    bytes1 description_;
    uint userId;
    uint amount;
    address voteSponsorAddr;

}
Posposal[] public curPosposals; 
uint public posposalNextId=0;

function MyContract() {

}
uint public expId;
address public expTarget;
string public expDes;
function issuse(uint userId,address target_,uint amount_,string description_)  {
    expId=userId;
    expTarget=target_;
    expDes=description_;
    curPosposals.push(Posposal(posposalNextId,0x00,userId,amount_,msg.sender));
    posposalNextId++;
}}
