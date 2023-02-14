
pragma solidity ^0.8.10;

contract App {
    address[] internal addresses;
    mapping(string => address) internal names;
    mapping(address => Profile) public profiles;
    mapping(address => mapping(address => Profile)) internal followers;
    mapping(address => mapping(address => Profile)) internal following;
    mapping(address => Post[]) internal posts;

    
    struct Profile {
        address owner;
        string name;
        uint timeCreated;
        uint id;
        uint postCount;
        uint followerCount;
        uint followingCount;
        address[] followers;
        address[] following;
    }

    
    struct Post {
        address author;
        string content;
        uint timeCreated;
        uint id;
    }

    
    modifier senderHasProfile() {
        require(profiles[msg.sender].owner != address(0x0), "ERROR: <Must create a profile to perform this action>");
        _;
    }

    
    modifier profileExists(address _address) {
        require(profiles[_address].owner != address(0x0), "ERROR: <Profile does not exist>");
        _;
    }

    
    modifier notSelf(address _address) {
        require(msg.sender != _address, "ERROR <You cannot follow/unfollow yourself");
        _;
    }

    
    modifier nonEmptyInput(string calldata _input) {
        require(keccak256(abi.encodePacked(_input)) != keccak256(abi.encodePacked("")), "ERROR: <Input cannot be empty>");
        _;
    }

    
    function createProfile(string calldata _name) external nonEmptyInput(_name) {
        
        require(profiles[msg.sender].owner == address(0x0), "ERROR: <You have already created a profile>");
        require(names[_name] == address(0x0), "ERROR: <Username taken>");

        
        names[_name] = msg.sender;

        
        profiles[msg.sender] = Profile({
            owner: msg.sender,
            name: _name,
            timeCreated: block.timestamp,
            id: addresses.length,
            postCount: 0,
            followerCount: 0,
            followingCount: 0,
            followers: new address[](0x0),
            following: new address[](0x0)
        });

        
        addresses.push(msg.sender);
    }

    
    function follow(address _address) external senderHasProfile profileExists(_address) notSelf(_address) {
        require(following[msg.sender][_address].owner == address(0x0), "ERROR: <You already follow this profile>");

        
        followers[_address][msg.sender] = profiles[msg.sender];
        following[msg.sender][_address] = profiles[_address];

        
        profiles[_address].followers.push(msg.sender);
        profiles[msg.sender].following.push(_address);

        
        profiles[_address].followerCount++;
        profiles[msg.sender].followingCount++;
    }

    
    
    function unfollow(address _address) external senderHasProfile profileExists(_address) notSelf(_address) {
        require(following[msg.sender][_address].owner != address(0x0), "ERROR: <You already do not follow this profile>");

        
        delete followers[_address][msg.sender];
        delete following[msg.sender][_address];

        
        for (uint i=0; i<profiles[_address].followerCount; i++) {
            if (profiles[_address].followers[i] == msg.sender) {
                delete profiles[_address].followers[i];
                profiles[_address].followerCount--;
                break;
            }
        }

        
        for (uint i=0; i<profiles[msg.sender].followingCount; i++) {
            if (profiles[msg.sender].following[i] == _address) {
                delete profiles[msg.sender].following[i];
                profiles[msg.sender].followingCount--;
                break;
            }
        }
    }

    
    function createPost(string calldata _content) external senderHasProfile() nonEmptyInput(_content) {
        
        Post memory newPost = Post({
            author: msg.sender,
            content: _content,
            timeCreated: block.timestamp,
            id: posts[msg.sender].length
        });

        
        posts[newPost.author].push(newPost);

        
        profiles[newPost.author].postCount++;
    }

    
    function deletePost(uint id) external senderHasProfile() {
        require(posts[msg.sender][id].author != address(0x0), "Post does not exist");

        delete posts[msg.sender][id];
        profiles[msg.sender].postCount--;
    }

    
    function getPosts(address _address) external view profileExists(_address) returns(Post[] memory) {
        return posts[_address];
    }

    
    function getUserCount() external view returns(uint) {
        return addresses.length;
    }

    
    function getAddresses() external view returns(address[] memory) {
        return addresses;
    }

    
    function getFollowers(address _address) external view profileExists(_address) returns(address[] memory) {
        return profiles[_address].followers;
    }

    
    function getFollowing(address _address) external view returns(address[] memory) {
        return profiles[_address].following;
    }
}
