function EstateManagement {
    struct Coordinates {
        uint256 x;
        uint256 y;
    }

    struct ApprovalRequest{
        bool isApproved;
        uint256 requestId;
        address owner;
        Coordinates[] coords;
        uint256[] tokenIds;
        string estateName;
        uint256 numOfParcels;
        string estateImageURI;
        uint256 requestDate;
    }

    function requestEstateApproval
    (
        Coordinates[] memory coords,
        uint256[] memory tokenIds,
        string memory estateName,
        string memory estateImageURI
    )
    public 
    nonReentrant
    returns (uint256)
    {
        require(coords.length == tokenIds.length, "Estate mgr: Lengths do not match");
        for (uint256 i = 0; i < tokenIds.length; i++) {
            address owner = Land.ownerOf(tokenIds[i]);
            require(owner == msg.sender, "Estate mgr: Only parcel owner can request for Estate");
            ILandContract1.ParcelInfo memory parcelInfo = Land.getAssetDetails(tokenIds[i]);
            require(parcelInfo.x == coords[i].x && parcelInfo.y == coords[i].y, "Estate mgr: Invalid coordinates");
        }
        
        requestCount++;
        idToApprovalRequest[requestCount] = 
        ApprovalRequest(
            false, requestCount, msg.sender, coords, tokenIds, estateName, tokenIds.length, estateImageURI, block.timestamp
        );
        
        return (requestCount);
    }
}

