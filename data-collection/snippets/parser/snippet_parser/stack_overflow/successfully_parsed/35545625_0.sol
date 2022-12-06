contract Coin {
    

    
    event Sent(address from, address to, uint amount);


    function send(address receiver, uint amount) public {
        

        
        emit Sent(msg.sender, receiver, amount);
    }
}
