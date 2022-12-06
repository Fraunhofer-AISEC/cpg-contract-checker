
    constructor() ERC721("vjkNFT", "vjkNFT") { 
        
                lines = 6;
                colors = ["red", "blue", "green", "yellow", "black", "orange"];
                backgrounds = ["red", "blue", "green", "yellow", "black", "orange"];
    }

    function generateRandomNumber( ) public view returns (uint256 uintRandomNumber) {
        retuns Random Number
    }

    function generateSVG() public view returns (string memory svg) {
        svg = "<svg version='1.1' viewBox='0 0 100 100'";
        svg = string(abi.encodePacked(svg, "xmlns='http://www.w3.org/2000/svg'"));
        string memory background = backgrounds[(generateRandomNumber() * 2 ) % backgrounds.length];
        svg = string(abi.encodePacked(svg, "style='background-color: ",background," '>"));

        for (uint256 i = 0; i < lines; i++) {
            uint256 randomNumber = generateRandomNumber() + i;            
            string memory color = colors[randomNumber % colors.length];
            svg = string(abi.encodePacked(svg, "<line stroke='" , color , "' "));
            svg = string(abi.encodePacked(svg, "stroke-width='4' ")); 
            svg = string(abi.encodePacked(svg, "opacity='0.3' "));
            svg = string(abi.encodePacked(svg, "x1='50' "));
            svg = string(abi.encodePacked(svg, "x2='150' />"));
        }

        svg = string(abi.encodePacked(svg, "</svg>"));
    }
