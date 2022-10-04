pragma solidity 0.5.1;

contract DeleteUser {

    struct UserStruct {
        bytes32[] assets;
        mapping(bytes32 => uint) assetPointers;
    }

    mapping(address => UserStruct) userStructs;

    function isUserAsset(address user, bytes32 assetId) public view returns(bool isIndeed) {
        if(userStructs[user].assets.length == 0) return false;
        return userStructs[user].assets[userStructs[user].assetPointers[assetId]] == assetId;
    }

    function deleteUserAsset(address user, bytes32 assetId) public {
        UserStruct storage u = userStructs[user];
        require(isUserAsset(user, assetId));
        uint rowToDelete = u.assetPointers[assetId];
        u.assets[rowToDelete] = u.assets[u.assets.length-1];
        u.assets.length--;
    }

}
