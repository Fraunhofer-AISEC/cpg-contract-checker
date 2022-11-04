pragma solidity ^0.5.1;

contract Board {

    
    Post[] posts;

    
    struct Post {
        address author;
        string title;
        string content;
        Comment[] comments;
    }

    struct Comment {
        address author;
        string comment;
    }

    
    function addPost(address _author, string memory _title, string memory _content) public {
        posts.push(Post(_author, _title, _content, ));
    }
}
