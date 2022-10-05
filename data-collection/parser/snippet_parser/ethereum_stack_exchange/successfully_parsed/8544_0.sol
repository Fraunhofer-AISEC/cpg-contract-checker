contract MyContract {
struct Posposal{
    uint posposalId;
    address voteSponsorAddr;

    bytes1 description_;
    uint userId;
    string message;
    uint amount;
}
Posposal[] public curPosposals;
uint public posposalNextId=0;

function MyContract() {

}
uint public expId;
address public expTarget;
uint public expAmount;
string public expMessage;
function issuse(uint userId,address target_,uint amount_,string message_)  {
    expId=userId;
    expMessage=message_;
    expAmount=amount_;
    expTarget=target_;
    curPosposals.push(Posposal(posposalNextId,msg.sender,0x01,userId,message_,amount_));
    posposalNextId++;
}} 
