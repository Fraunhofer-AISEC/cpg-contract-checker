pragma solidity 0.4.25;

contract Banners {

    struct BannerStruct {
        string marque;
        bytes32 placeId; 
        uint idPointer;
    }

    struct PlaceStruct {
        string name;
        bytes32 bannerId; 
        uint idPointer;
    }

    mapping(bytes32 => BannerStruct) public bannerStructs;
    mapping(bytes32 => PlaceStruct) public placeStructs;

    bytes32[] public bannerIdList;
    bytes32[] public placeIdList;

    function getBannerCount() public view returns(uint) {
        return bannerIdList.length;
    }

    function getPlaceCount() public view returns(uint) {
        return placeIdList.length;
    }

    function isBanner(bytes32 bannerId) public view returns(bool) {
        if(bannerIdList.length==0) return false; 
        return bannerIdList[bannerStructs[bannerId].idPointer] == bannerId;
    }

    function isPlace(bytes32 placeId) public view returns(bool) {
        if(placeIdList.length==0) return false;
        return placeIdList[placeStructs[placeId].idPointer] == placeId;
    }

    function placeHasBanner(bytes32 placeId) public view returns(bool) {
        return isBanner(placeStructs[placeId].bannerId);
    }

    function newBanner(bytes32 bannerId, string marque) public returns(bool) {
        require(!isBanner(bannerId)); 
        bannerStructs[bannerId].marque = marque;
        bannerStructs[bannerId].idPointer = bannerIdList.push(bannerId) - 1;
        return true;
    }

    function newPlace(bytes32 placeId, string name) public returns(bool) {
        require(!isPlace(placeId));
        placeStructs[placeId].name = name;
        placeStructs[placeId].idPointer = placeIdList.push(placeId) - 1;
        return true;
    }

    function setPlaceBanner(bytes32 placeId, bytes32 bannerId) public returns(bool) {
        require(isPlace(placeId));
        require(isBanner(bannerId));
        if(bannerStructs[bannerId].placeId != 0) { 
            bytes32 oldPlace = bannerStructs[bannerId].placeId;
            placeStructs[oldPlace].bannerId = bytes32(0);
        }
        bannerStructs[bannerId].placeId = placeId;
        placeStructs[placeId].bannerId = bannerId;
    }
}
