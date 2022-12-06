contract Post {
  
  uint256 private currentIndex = 0;

  

  struct PostStruct {
    uint256 id;
    address user;
    string title;
    string body;
    string thumbnail;
    PostStatusEnum status;
    bool deleted;
  }

  PostStruct[] private posts;
  mapping(address => uint256[]) postIndexesByUser; 

  

}
