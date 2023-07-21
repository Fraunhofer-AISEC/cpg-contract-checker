
pragma solidity ^0.8.17;

contract list{

uint256   highestbid;
uint256  id;
address owner;
address winaddress;
mapping(uint256=>mapping(address=>uint256))public bidlist;

constructor(){
    owner=msg.sender;
}
modifier funds(){
require(msg.sender.balance>highestbid,"note enought funds");
_;

}

function bid(uint _bidamount)public  funds{
if(_bidamount>highestbid){
highestbid=_bidamount;
id++;
bidlist[id][owner]=_bidamount;

}else
revert("place highest bid");
}

function winneramount() public view returns(uint256){
return highestbid;
}
}
