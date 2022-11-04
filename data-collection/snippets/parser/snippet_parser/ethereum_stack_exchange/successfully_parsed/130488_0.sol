
pragma solidity ^0.6.0;

contract myTest2
{
    address payable owner;
    event Minted(address ownerAddress,string message);
    event transfer(address sender, string message2);

constructor () public
{
    owner = msg.sender;
}

function mint() payable external
{
    require(msg.value == 2 ether,"Not enough amount transfered to mint");
    emit Minted(msg.sender,"Minted");
}
}