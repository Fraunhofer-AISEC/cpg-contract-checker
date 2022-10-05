contract AccessManagement {

struct Authorization {
    string role;
    bool active;
}

struct Asset {
    address owner;
    address[] authorizationList;
    mapping(address => Authorization) authorizationStructs;
    bool initialized;    
}

mapping(string => Asset) assetStructs;
string[] assetList;

function newAsset(string assetKey) public returns(bool success) {
    
    assetStructs[assetKey].owner = msg.sender;
    assetStructs[assetKey].initialized = true;
    assetList.push(assetKey);
    return true;
} 

function addAuthorization(string assetKey, address authorizationKey, string authorizationRole) public returns(bool success) {
    
    
    assetStructs[assetKey].authorizationList.push(authorizationKey);
    assetStructs[assetKey].authorizationStructs[authorizationKey].role = authorizationRole;
    assetStructs[assetKey].authorizationStructs[authorizationKey].active = true;
    return true;
}
function getAssetAuthorization(string assetKey, address authorizationKey) public constant returns(string authorizationRole) {
    return(assetStructs[assetKey].authorizationStructs[authorizationKey].role);
}
}
