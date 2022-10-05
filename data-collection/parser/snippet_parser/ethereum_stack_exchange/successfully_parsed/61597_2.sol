pragma experimental ABIEncoderV2;

contract d {
    struct Img {
        uint IDNumber;
        string color;
        address ownerAddress;
    }

    Img[] public imgsBoughtArray;

    function getBoughtImages() public returns (uint256[] memory imgsIDs, string[] memory imgsColors, address[] memory ownerIds) {
        uint[] memory boughtImgsIdsArray = new uint[](10);
        string[] memory imgsColorsArray = new string[](10);
        address[] memory ownersAddressesArray =  new address[](10);

        for (uint i = 0; i < 10; i++) {
            boughtImgsIdsArray[i] = (imgsBoughtArray[i].IDNumber);
            imgsColorsArray[i] = (imgsBoughtArray[i].color);
            ownersAddressesArray[i] = (imgsBoughtArray[i].ownerAddress);
        }
        return (boughtImgsIdsArray, imgsColorsArray, ownersAddressesArray);
    }
}
