contract TokenURIMaker {

    constructor() {}

    function baseSection(string calldata name, string calldata description, string calldata image, string calldata annimation)internal pure returns(bytes memory) {
        bytes memory base = abi.encodePacked('{"name": "',
            name,
            '", "image": "',
            image,
            '", "description": "',
            description,
            '","animation_url": "',
            annimation);

            return base;
    }
    function atributesSection(string calldata avatarWL, uint wlSpots, uint winChances, uint softClay )internal pure returns(bytes memory){
        bytes memory atri = abi.encodePacked('", "attributes": [{ "trait_type": "Avatar WL", "value": "',
            avatarWL,
            '"},{ "display_type": "boost_number","trait_type": "City WL Spots", "value": "',
             Strings.toString(wlSpots),
            '"},{ "display_type": "boost_number","trait_type": "Win Chances", "value": "',
             Strings.toString(winChances),
            '"},{ "display_type": "boost_number","trait_type": "Soft Clay", "value": "',
             Strings.toString(softClay),
            '"}]}');
            return atri;
    }

    function maketokenURi(string calldata name, string calldata image, string calldata description, string calldata annimation, string calldata avatarWL, uint wlSpots, uint winChances, uint softClay ) external pure returns(string memory){
        
        bytes memory base = baseSection(name, description, image, annimation);
        bytes memory atri = atributesSection(avatarWL, wlSpots, winChances, softClay);
        bytes memory dataURI = abi.encodePacked(
            base, atri
        );
        return
            string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    Base64.encode(dataURI)
                )
            );
    }

}
