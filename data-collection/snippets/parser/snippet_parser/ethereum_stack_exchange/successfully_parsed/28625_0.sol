pragma solidity ^0.4.0;

contract Post{
    address author;
    uint _id;
    struct UserDetails{
     string title;
     string description;
     address owner;
}

mapping (uint => UserDetails) postDetails;

function Post() public{
    author = msg.sender;
}

function addPost(string title, string description) public returns (uint){
    _id += 1;
    postDetails[_id] = UserDetails(title, description, author);
    return _id;
}

function getPost(uint id) constant returns (string title, string description, address owner){
    return (postDetails[id].title, postDetails[id].description, postDetails[id].owner);
}


function getPostCount() constant returns (uint){
    return _id;
}

}
