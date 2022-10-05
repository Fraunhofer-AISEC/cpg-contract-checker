contract InfoFeed {
    function info() payable returns (uint ret) { return 42; }
}

contract Consumer {
  InfoFeed feed;
  function setFeed(address addr) { feed = InfoFeed(addr); }
  function callFeed() { attribut = feed.info.value(10).gas(800); }  
}
