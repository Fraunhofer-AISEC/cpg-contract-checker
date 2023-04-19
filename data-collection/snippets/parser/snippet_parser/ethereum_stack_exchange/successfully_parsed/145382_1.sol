    function mint(uint256 tokenId) external payable {
      if(msg.value == 0.01 ether){
         require(msg.value == 0.01 ether, 'Wrong price');
         _safeMint(msg.sender, tokenId);
      } else {
        
      }
    }
