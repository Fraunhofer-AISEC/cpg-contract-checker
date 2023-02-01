address payable public Owner;

mapping(address => User) public users;

struct User {
    address useraddress;
    Post[] posts;
}

struct Post {
    string contentlink;
    uint likes;
    uint dislikes;
}

constructor() {
    Owner = payable(msg.sender);
}

function login() public {
    require(users[msg.sender].useraddress != msg.sender, "Already have account");
    users[msg.sender] = User(msg.sender, new Post());
}
