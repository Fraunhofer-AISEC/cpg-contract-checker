function initializeToken(string memory name, string memory symbol) public returns (uint256) {

   
   address creator = msg.sender;
   _creatorIds.increment();
   newId = _creatorIds.current();

   Token token = new Token(symbol, name, creator);
   _tokens[newId] = address(token);
   return newId;
}
