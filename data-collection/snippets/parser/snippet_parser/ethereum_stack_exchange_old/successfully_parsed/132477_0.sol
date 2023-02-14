
pragma solidity ^0.8.0;

contract QuoteV2{
string private quote;

event quoteUploaded(string newQuote);


struct userQuoteTime {
    mapping(address => string) u;

    string _quote;
    string _time ;        
    

}

struct newUser {
        string userName;
        address walletAddress;
}
mapping (uint256 => newUser) public users;

    event newUserCame(uint256 indexed _userId);
uint256 public userCount;

function setQuote(string memory _quote) public {
    quote = _quote;

    emit quoteUploaded(_quote);
}
function getQuote() public view returns(string memory){
    return quote;
}
function newUserF(address _walletAddress, string memory _userName) public {
    newUser memory User;

    User.userName = _userName;
    User.walletAddress = _walletAddress;
    users[userCount] = newUser(_userName, _walletAddress);
    userCount++;

}

    


function getUsers() public view returns (newUser[] memory){
  newUser[] memory id = new newUser[](userCount);
  for (uint i = 0; i < userCount; i++) {
      newUser storage user = users[i];
      id[i] = user;
  }
  return id;
  }
}