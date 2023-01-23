function mint(uint256 _mintAmount) public payable mintCompliance(_mintAmount) {
      require(!paused, "The contract is paused!");
      require(msg.value >= cost * _mintAmount, "Insufficient funds!");

    if (msg.sender != owner()) {
        if(onlyWhitelisted == true) {
            require(isWhitelisted(msg.sender), "user is not whitelisted");
    }
    require(msg.value >= cost * _mintAmount, "insufficient funds");
    }

    _mintLoop(msg.sender, _mintAmount);
} 

    function presaleMint(uint256 _mintAmount) public payable mintCompliancePresale(_mintAmount) {
      require(!paused, "The contract is paused!");
      require(msg.value >= cost * _mintAmount, "Insufficient funds!");

    if (msg.sender != owner()) {
        if(onlyWhitelisted == true) {
            require(isWhitelisted(msg.sender), "user is not whitelisted");
    }
    require(msg.value >= cost * _mintAmount, "insufficient funds");
    }

    _mintLoop(msg.sender, _mintAmount);
} 
