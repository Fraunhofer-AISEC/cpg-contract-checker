function create(uint256 mintAmount) external payable {
    require(msg.value >= cost, "Not enough ether sent");
    require(totalSupply() + 1 <= maxSupply, "There are not enough NFTs in the supply");

    for (uint256 i=1; i<=mintAmount; i++) {
        uint newTokenId = _tokenIdCounter.current();
        _safeMint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, generateImage(['white','white','white','white','white','white','white','white']));
        _tokenIdCounter.increment();
    }
}

function generateImage(string[8] memory colors) internal pure returns (string memory) {
     return string(
        abi.encodePacked(
            [mySVGimg]
        )
    );
}

function buildPolygons() internal pure returns (string memory) {
     string memory polygons;
     for (uint256 i=1; i<=20; i++) {
         polygons = string(abi.encodePacked(polygons,'<polygon class="triangle triangle-',i,'" points="500,200 759,650 241,650"/>'));
     }
     return polygons;
}

function buildTriangles() internal pure returns (string memory) {
    string memory triangles;
    uint delay = 0;
    uint incr = 1;
     for (uint256 i=0; i<20; i++) {
         triangles = string(abi.encodePacked(triangles,'.triangle-',i,'{animation-delay:',delay,'s}'));
         delay = delay - (incr/2);
     }
     return triangles;
}

function svgToImageURI(string memory svg) internal pure returns (string memory) {
    return string(abi.encodePacked("data:image/svg+xml;base64,",Base64.encode(bytes(string(abi.encodePacked(svg))))));
}

function formatTokenURI(string memory imageURI, uint newTokenId, string[8] memory colors) internal pure returns(string memory) {
    return string(
        abi.encodePacked(
            "data:application/json;base64,",
            Base64.encode(
                bytes(
                    abi.encodePacked(
                        '{"tokenId":"',newTokenId.toString(),'", "name":"Test#',newTokenId.toString(),'", "description" : "A Test", "attributes":[{"trait_type":"Background #1","value":"',colors[0],'"},{"trait_type":"Background #2","value":"',colors[1],'"},{"trait_type":"Background #3","value":"',colors[2],'"},{"trait_type":"Color #1","value":"',colors[3],'"},{"trait_type":"Color #2","value":"',colors[4],'"},{"trait_type":"Color #3","value":"',colors[5],'"},{"trait_type":"Color #4","value":"',colors[6],'"},{"trait_type":"Color #5","value":"',colors[7],'"}], "image":"',imageURI,'"}'
                    )
                )
            )
        )
    );
}
