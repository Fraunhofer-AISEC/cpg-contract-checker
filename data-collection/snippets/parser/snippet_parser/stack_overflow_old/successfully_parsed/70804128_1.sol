pragma solidity >=0.4.22 <0.9.0;
import "../category/Category.sol";


contract Post is Category {
  
  uint256 currentPostIndex;

  struct PostStruct {
    uint256 id;
    address user;
    string title;
    string body;
    uint256 categoryId;
  }
  struct PostInputStruct {
    string title;
    string body;
    uint256 categoryId;
  }

  PostStruct[] private posts;
  mapping(address => uint256[]) postIndexesByUser; 

  
  modifier onlyValidPostInput(PostInputStruct memory _input) {
    bytes memory errCode;
    bytes memory title = bytes(_input.title);
    bytes memory body = bytes(_input.body);
    uint256 categoryId = uint256(_input.categoryId);

    if (title.length == 0) {
      errCode = bytes("invalidTitle");
    } else if (body.length == 0) {
      errCode = bytes("invalidBody");
    }
    if (errCode.length > 0) {
      revert(string(errCode));
    }
    _;
  }

  

  constructor() {
    currentPostIndex = posts.length;
  }

  

  
  
  function createPost(PostInputStruct memory _input)
    external
    onlyValidPostInput(_input)
    returns (bool)
  {
    bool isExist = isCategoryExists(_input.categoryId);

    PostStruct memory newPost = PostStruct({
      id: currentPostIndex,
      user: msg.sender,
      title: _input.title,
      body: _input.body,
      categoryId: _input.categoryId
    });

    posts.push(newPost);
    postIndexesByUser[msg.sender].push(currentPostIndex);

    currentPostIndex++;
    return true;
  }
}

