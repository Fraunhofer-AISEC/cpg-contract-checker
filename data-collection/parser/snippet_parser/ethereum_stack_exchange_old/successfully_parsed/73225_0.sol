pragma solidity 0.5.3;


import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/math/SafeMath.sol";


contract IPFSPosting{
  using SafeMath for uint256;

  
  struct Post{
    
    address owner;
    
    string imgHash;
    
    string textHash;
  }

  
  mapping(uint256 => Post) post;

  
  uint256 postCtr;
  event NewPost();
  
  function sendHash(string memory _img, string memory _text)
    public {
      postCtr = postCtr.add(1);
      Post storage posting = post[postCtr];
      posting.owner = msg.sender;
      posting.imgHash = _img;
      posting.textHash = _text;

      emit NewPost();
    }
  
  
  
  function getHash(uint256 _index)
  public view returns (string memory img, string memory text, address owner)
  {
    owner = post[_index].owner;
    img = post[_index].imgHash;
    text = post[_index].textHash;
  }
  
  
  function getCounter() public view returns(uint256){ return postCtr;}
}


