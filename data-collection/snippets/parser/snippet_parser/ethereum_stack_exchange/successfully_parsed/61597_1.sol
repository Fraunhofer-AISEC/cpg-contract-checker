struct Img {
    uint IDNumber;
    string color;
    address ownerAddress;
}


Img[] public imgsBoughtArray;



function getBoughtImages() public view returns (uint256[] memory imgsIDs, string[] memory imgsColors, address[] memory ownerIds) {
    uint[] memory boughtImgsIdsArray = new uint[];
    string[] memory imgsColorsArray = new string[];
    address[] memory ownersAddressesArray =  new address[];

    for (uint i = 0; i < 10; i++) {
        boughtImgsIdsArray[i] = (imgsBoughtArray[i].IDNumber);
        imgsColorsArray[i] = (imgsBoughtArray[i].color);
        ownersAddressesArray[i] = (imgsBoughtArray[i].ownerAddress);
    }
    return (boughtImgsIdsArray, imgsColorsArray, ownersAddressesArray);
}
