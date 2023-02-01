contract TokenURIMaker {
    constructor() {}

    struct JsonData {
        string name;
        string image;
        string description;
        string annimation;
        string avatarWL;
        uint256 wlSpots;
        uint256 winChances;
        uint256 softClay;
    }

    function baseSection(JsonData calldata json) internal pure returns (bytes memory) {
        bytes memory base = abi.encodePacked(
            '{"name": "',
            json.name,
            '", "image": "',
            json.image,
            '", "description": "',
            json.description,
            '","animation_url": "',
            json.annimation
        );

        return base;
    }

    function atributesSection(JsonData calldata json) internal pure returns (bytes memory) {
        bytes memory atri = abi.encodePacked(
            '", "attributes": [{ "trait_type": "Avatar WL", "value": "',
            json.avatarWL,
            '"},{ "display_type": "boost_number","trait_type": "City WL Spots", "value": "',
            Strings.toString(json.wlSpots),
            '"},{ "display_type": "boost_number","trait_type": "Win Chances", "value": "',
            Strings.toString(json.winChances),
            '"},{ "display_type": "boost_number","trait_type": "Soft Clay", "value": "',
            Strings.toString(json.softClay),
            '"}]}'
        );
        return atri;
    }

    function maketokenURi(JsonData calldata json) external pure returns (string memory) {
        bytes memory base = baseSection(json);
        bytes memory atri = atributesSection(json);
        bytes memory dataURI = abi.encodePacked(base, atri);
        return string(abi.encodePacked("data:application/json;base64,", Base64.encode(dataURI)));
    }
}
