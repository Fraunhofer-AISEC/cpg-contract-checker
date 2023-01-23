   function Upload(string memory _songName) public {
      artists[msg.sender].songNames.push(_songName);
   }
