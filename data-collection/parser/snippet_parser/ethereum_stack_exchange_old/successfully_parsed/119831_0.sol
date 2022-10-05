
pragma solidity >=0.5.0<0.9.0;
contract Lottery{
address public Lottery_master;
address [] public participants;
mapping (address => uint) public winner;
uint [] public winners;

constructor(){
Lottery_master= (msg.sender);
}
function reset_Lottery() private{
participants= new address[](0);
}
 modifier adminOnly() {
 require(Lottery_master == msg.sender, "You are not the owner");
        _;
 }
receive () external payable{
 require(msg.value==25000000000000000 wei);
 require(msg.sender!=Lottery_master);
    participants.push((msg.sender));
}
function random() public view returns(uint){
 return uint(keccak256(abi.encodePacked( block.difficulty,block.timestamp,participants.length)));
}
function find(uint index) public view returns(bool){
 for(uint c=0; c<=winners.length;c++){
 if (winners[c]==winners[index]){
 return true;
 }
 }
 return false;
}
function pick_winner() public adminOnly {
 require(participants.length>0);
 uint l= participants.length;
 uint c;
 while(c<=participants.length/2){
 uint winning_index= random()%l;
 if(!find(winning_index)){
    winners.push(winning_index);
    c++;
    winner[participants[winning_index]]=c;
 }
 

}
}
function claim() public{
 require(winner[msg.sender]!=0);
 payable(msg.sender).transfer(45000000000000000 wei);

}
}
