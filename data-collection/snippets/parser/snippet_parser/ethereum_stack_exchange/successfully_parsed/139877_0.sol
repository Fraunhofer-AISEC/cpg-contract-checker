contract  Blog {
    uint256 counter ;
    struct BlogPost {
        uint256 id;
        string title;
        string content;
        address user;
    }
    BlogPost[] public posts;
    
    function createPost(string calldata _title, string calldata _content) external {
        counter+=1;
        BlogPost memory newPost;
        newPost.id=counter;
        newPost.title=_title;
        newPost.content=_content;
        newPost.user=msg.sender;
        posts.push(newPost);
    }
}
