contract ReplicatorB {

    address creator;
    uint blockCreatedOn;

    function Replicator() 
    {
        creator = msg.sender;
       
                         
                         
        blockCreatedOn = block.number;
    }

  function getBlockCreatedOn() constant returns (uint)
  {
    return blockCreatedOn;
  }

    

    function kill()
    { 
        if (msg.sender == creator)
        {
            suicide(creator);  
        }
    }
}

contract ReplicatorA {

    address creator;
  address baddress;
  uint blockCreatedOn;

    function Replicator() 
    {
        creator = msg.sender;
        baddress = new ReplicatorB();    
        blockCreatedOn = block.number;
    }

  function getBAddress() constant returns (address)
  {
    return baddress;
  }

  function getBlockCreatedOn() constant returns (uint)
  {
    return blockCreatedOn;
  }

    

    function kill()
    { 
        if (msg.sender == creator)
        {
            suicide(creator);  
        }
    }
}
