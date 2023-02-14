function transfer(bytes32 _ID) public returns (address) {
    
    if (ID == _ID) {    
      owner = msg.sender;
      taddr.push(msg.sender);
      ttime.push(now);        
      emit Accessed("someone executed the transfer function",owner,now);
      
      return(owner); 
    } 
}
