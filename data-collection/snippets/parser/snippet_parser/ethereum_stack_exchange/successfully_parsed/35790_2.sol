pragma solidity 0.5.1;

contract DeleteUser {

    struct UserStruct {
        uint userId;
        uint[] assets;
    }

    mapping(address => UserStruct) public userStructs;

    function deleteUserAsset(address user, uint assetIndex, uint asset) public {
        UserStruct storage u = userStructs[user];
        require(u.assets.length > assetIndex);
        require(u.assets[assetIndex] == asset); 
        u.assets[assetIndex] = u.assets[u.assets.length-1];
        u.assets.length--;
    }

}
