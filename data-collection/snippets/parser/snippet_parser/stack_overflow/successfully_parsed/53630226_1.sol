pragma solidity ^0.5.1;

contract Board {

    
    uint256 public postAmount = 0;
    mapping(uint256 => Post) public posts;

    struct Comment {
        address author;
        string comment;
    }

    struct Post {
        address author;
        string title;
        string content;
        Comment[] comments;
    }

    
    function addPost(address _author, string memory _title, string memory _content, string memory _comment) public {
        Post storage post = posts[postAmount];
        post.author = _author;
        post.title = _title;
        post.content = _content;

        bytes memory tempEmptyString = bytes(_comment);
        if (tempEmptyString.length != 0) { 
            post.comments.push(Comment({
                 author: _author,
                 comment: _comment
            }));
            postAmount++;
        }
    }

    function getComment(uint256 _postIndex, uint256 _commentIndex) public view returns(string memory) {
        Post memory post = posts[_postIndex];
        return post.comments[_commentIndex].comment;
    }
}
