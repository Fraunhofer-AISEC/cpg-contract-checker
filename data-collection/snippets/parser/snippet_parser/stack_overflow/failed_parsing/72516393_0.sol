
function depositEthers() public payable
{
    require(users[msg.sender].flag != 0, "You are not a registered user, 
get yourself registered first");
    require(msg.value > 0, "No Ethers was sent, Please send Ethers");
    users[msg.sender].balance += msg.value;
}



function BuyLand
(
    uint _landId
) public payable
{
    require(landOwnerMapping[_landId] != msg.sender, "You can not Buy 
Land because you are the Owner");
    require(BuyerMapping[msg.sender].isVerified == true, "Buyer is not 
verified");
    require(SellerMapping[landOwnerMapping[_landId]].isVerified == true, 
"Seller is not verified");
    require(Lands[_landId].isVerified == true, "Land is not verified");

    if (msg.value > Lands[_landId].LandPrice*1000000000000000000)
    {
        
        emit buyingLand("Land not bought, sent more Ethers than Land 
price",
        _landId, Lands[_landId].LandPrice, landOwnerMapping[_landId], 
msg.sender);
    }

    else if (msg.value < Lands[_landId].LandPrice*1000000000000000000)
    {
        
        emit buyingLand("Land not bought, sent less Ethers than Land 
price",
        _landId, Lands[_landId].LandPrice, landOwnerMapping[_landId], 
msg.sender);
    }

    else
    {
        payable(landOwnerMapping[_landId]).transfer(msg.value);
        landOwnerMapping[_landId] = msg.sender;
        ownerMapping[msg.sender] = _landId;
        emit buyingLand("Land bought successfully",
        _landId, Lands[_landId].LandPrice, landOwnerMapping[_landId], 
msg.sender);
    }
}
