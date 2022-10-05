contract InfoFeed {
    function info() payable returns (uint ret) { }
}

contract Consumer {
  InfoFeed feed;
  function setFeed(address addr) { feed = InfoFeed(addr); }
  function callFeed() { attribut = feed.info.value(10).gas(800)(); }  
}
