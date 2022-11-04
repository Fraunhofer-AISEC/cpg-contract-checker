function newToken(address generator, address payable receiver) payable public returns(bool success) 
{
    receiver.transfer(1 ether);
    
}
