address[] followerArray;
address[] followingArray;

mapping(address => address[]) addressToFollowerArray;
mapping(address => address[]) addressToFollowingArray;

function follow(address _followed) external {
        addressToFollowingArray[msg.sender] = followingArray.push(_followed);
        followingArray.push(_followed); 

        
        
        addressToFollowerArray[_followed] = followerArray.push(msg.sender);
    }

