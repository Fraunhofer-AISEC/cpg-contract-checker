contract OwnedToken {

TokenCreator creator;
address owner;
bytes32 name;

function OwnedToken(bytes32 _name) {
    owner = msg.sender;

    creator = TokenCreator(msg.sender);
    name = _name;
}
function changeName(bytes32 newName) {

    if (msg.sender == creator) name = newName;
}
function transfer(address newOwner) {
    if (msg.sender != owner) return;

    if (creator.isTokenTransferOK(owner, newOwner))
        owner = newOwner;
}


contract TokenCreator {
    function createToken(bytes32 name)
       returns (OwnedToken tokenAddress)
    {

        return new OwnedToken(name);
    }
    function changeName(OwnedToken tokenAddress, bytes32 name) {

        tokenAddress.changeName(name);
    }
    function isTokenTransferOK(
        address currentOwner,
        address newOwner
    ) returns (bool ok) {
        address tokenAddress = msg.sender;
        return (sha3(newOwner) & 0xff) == (bytes20(tokenAddress) & 0xff);
    }
}
