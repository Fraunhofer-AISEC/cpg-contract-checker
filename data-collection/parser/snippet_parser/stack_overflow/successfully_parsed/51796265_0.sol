pragma solidity ^0.4.24;

contract MediaGallery {
address owner;
uint counter;

struct MediaAsset {
    uint id;
    string name;
    address author;
    uint createDate;
    string[] tags;
    string mediaHash;
}

mapping(address => MediaAsset[]) public mediaDatabase;

constructor () {
    owner = msg.sender;
}

function addMedia(string _name, string _mediaHash) public returns (bool success) {
    MediaAsset memory currentMedia;

    currentMedia.id = counter;
    currentMedia.name = _name;
    currentMedia.author = msg.sender;
    currentMedia.createDate = now;
    currentMedia.mediaHash = _mediaHash;

    mediaDatabase[msg.sender].push(currentMedia);

    return true;
}

function addTag(uint _id, string _tag) public returns (bool success) {
    mediaDatabase[msg.sender][_id].tags.push(_tag);

    return true;
}

function getMediaByAddress(address _user) public view returns (uint[]) {
    uint[] memory mediaAssetIds = new uint[](mediaDatabase[_user].length);

    uint numberOfMediaAssets = 0;

    for(uint i = 1; i <= mediaDatabase[_user].length;  i++) {
        mediaAssetIds[numberOfMediaAssets] = mediaDatabase[_user][i].id;
        numberOfMediaAssets++;
    }
    return mediaAssetIds;
}
}