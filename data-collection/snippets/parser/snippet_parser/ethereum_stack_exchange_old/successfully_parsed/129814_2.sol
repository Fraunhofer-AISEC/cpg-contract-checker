    function maketokenURi(
        string calldata name,
        string calldata image,
        string calldata description,
        string calldata annimation,
        string calldata avatarWL,
        uint256 wlSpots,
        uint256 winChances,
        uint256 softClay
    ) external pure returns (string memory) {
        bytes memory attributes = abi.encodePacked(
            '[{ "trait_type": "Avatar WL", "value": "',
            avatarWL,
            '"},{ "display_type": "boost_number","trait_type": "City WL Spots", "value": "',
            Strings.toString(wlSpots),
            '"},{ "display_type": "boost_number","trait_type": "Win Chances", "value": "',
            Strings.toString(winChances),
            '"},{ "display_type": "boost_number","trait_type": "Soft Clay", "value": "',
            Strings.toString(softClay),
            '"}]'
        );

        bytes memory dataURI = abi.encodePacked(
            '{"name": "',
            name,
            '", "image": "',
            image,
            '","animation_url": "',
            annimation,
            '","attributes": ',
            attributes,
            '}'
        );

        return string(abi.encodePacked("data:application/json;base64,", Base64.encode(dataURI)));
    }
