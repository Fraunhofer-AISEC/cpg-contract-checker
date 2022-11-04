function mint() payable public returns (uint256) {
     require(msg.value == 0.1 ether || msg.value == 100000000000000000 
         wei, "Transaction amount has to be 0.1 eth");

     IERC20(*the ETH address here*).approve(msg.sender, msg.value);
     IERC20(*the ETH address here*).transferFrom(msg.sender, address(this), msg.value);

      _safeMint(msg.sender, token_id);

     return token_id;
    }
