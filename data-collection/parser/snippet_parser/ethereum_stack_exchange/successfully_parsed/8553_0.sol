contract MyContract {
struct Posposal{
    uint posposalId;
    address voteSponsorAddr;

    bytes1 description_;
    uint userId;
    uint amount;
}
Posposal[] public curPosposals; 
uint public posposalNextId=0;

function MyContract() {

}
uint public expId;
address public expTarget;
uint public expAmount;
function issuse(uint userId,address target_,uint amount_)  {
    
    expId=userId;
    expAmount=amount_;
    expTarget=target_;
    curPosposals.push(Posposal(posposalNextId,msg.sender,0x01,userId,amount_));
    posposalNextId++;
}}
