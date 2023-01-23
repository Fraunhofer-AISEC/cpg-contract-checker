pragma solidity ^0.5.1;

import "./HitchensUnorderedAddressSet.sol";

contract NestedStructs {

    using HitchensUnorderedAddressSetLib for HitchensUnorderedAddressSetLib.Set;

    struct UserStruct {
        uint balance;
        bool active;
        HitchensUnorderedAddressSetLib.Set followingSet;
        HitchensUnorderedAddressSetLib.Set followerSet;
    }

    mapping(address => UserStruct) userStructs;
    HitchensUnorderedAddressSetLib.Set userSet;

    function createUser(address user) public { 
        UserStruct storage u = userStructs[user];
        userSet.insert(user); 
        u.active = true;
    }

    function join() public {
        createUser(msg.sender);
    }

    function followUser(address followed ) public {
        require(userSet.exists(msg.sender), "Join first please.");
        require(userSet.exists(followed), "Follow a joined user please.");
        UserStruct storage u = userStructs[msg.sender];
        UserStruct storage f = userStructs[followed];
        u.followingSet.insert(followed);
        f.followerSet.insert(msg.sender); 
    }

    function unFollowUser(address unfollow) public {
        
        UserStruct storage u = userStructs[msg.sender];
        UserStruct storage f = userStructs[unfollow];
        u.followingSet.remove(unfollow);
        f.followerSet.remove(msg.sender); 
    }

    function isUser(address user) public view returns(bool) {
        return userSet.exists(user);
    }

    function userCount() public view returns(uint) {
        return userSet.count();
    }

    function userInfo(address user) public view returns(uint balance, bool active, uint followingCount, uint followerCount) {
        UserStruct storage u = userStructs[user];
        balance = u.balance;
        active = u.active;
        followingCount = u.followingSet.count();
        followerCount = u.followerSet.count();
    }

    function userFollowerAtIndex(address user, uint index) public view returns(address) {
        return userStructs[user].followerSet.keyAtIndex(index);
    }

    function userFollowingAtIndex(address user, uint index) public view returns(address) {
        return userStructs[user].followingSet.keyAtIndex(index);
    }
}
