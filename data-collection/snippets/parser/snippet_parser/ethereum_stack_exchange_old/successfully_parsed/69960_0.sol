uint public createPostCost = 0.0003 ether;

function createPost(bytes32 _post) 
    public payable {
        require(msg.value >= createPostCost);
        Post memory newPost;
        newPost.post = _post;
    }
