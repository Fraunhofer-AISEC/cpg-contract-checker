event MintMessage(string message);

function mint(address to, string message) public virtual {
   
   
   emit MintMessage(message);
}
