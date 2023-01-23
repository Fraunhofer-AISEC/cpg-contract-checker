contract Gallery{
uint public emojiCount;
struct Token {
    uint token;
    string ipfsHash;
}
mapping (address => Token[]) public emoji;

function addEmoji (uint _token, string _ipfsHash) public {
   emojiCount ++;
   emoji[msg.sender].push(Token(_token, _ipfsHash));
 }
}
