    struct Post {
        uint256 amt;
        bool isActive;
        address owner;
    }

    Post[] public posts;

    function createP(uint256 amt) public payable returns(uint a) {
        posts.push(Post({
            amt: amt,
            isActive: false,
            owner: msg.sender
        }));
        return (posts.length);
    }
    function getPostLength() returns(uint a){
        return (posts.length);
    }
