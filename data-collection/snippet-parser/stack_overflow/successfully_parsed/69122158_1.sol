

pragma solidity ^0.8.7;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Contract is ERC721, Ownable {
    uint256 public constant maxTokens = 6969;    
    uint256 public constant maxMintsPerTx = 10;
    uint256 public tokenPrice = 20000000000000000; 
    uint256 public startingBlock =999999999;
    string private _contractURI;
    string public provenance;
    uint256 public nextTokenId=1;
    bool public devMintLocked = false;
    bool private initialized = false;
    
     string[] private wrap = [
        "three"
    ];
    
    string[] private paper = [
        "two"
    ];
    
    string[] private second = [
        "one"
    ];
    
    string[] private first = [
        "one"
    ];
    
    string[] private format = [
        "one"
    ];
    
    string[] private next = [
        "one"
    ];
    
    string[] private suffixes = [
        "one"
    ];
    
    string[] private namePrefixes = [
        "two"
    ];
    
    string[] private nameSuffixes = [
        "one"
    ];
    
    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }
    
    function getWrap(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "WRAP", wrap);
    }
    
    function getPaper(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "PAPER", paper);
    }
    
    function getSecond(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "SECOND", second);
    }
    
    function getFirst(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "FIRST", first);
    }

    function getFormat(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "FORMAT", format);
    }
    
    function getNext(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "NEXT", next);
    }
    
    
    function pluck(uint256 tokenId, string memory keyPrefix, string[] memory sourceArray) internal view returns (string memory) {
        uint256 rand = random(string(abi.encodePacked(keyPrefix, toString(tokenId))));
        string memory output = sourceArray[rand % sourceArray.length];
        uint256 greatness = rand % 21;
        if (greatness > 14) {
            output = string(abi.encodePacked(output, " ", suffixes[rand % suffixes.length]));
        }
        if (greatness >= 19) {
            string[2] memory name;
            name[0] = namePrefixes[rand % namePrefixes.length];
            name[1] = nameSuffixes[rand % nameSuffixes.length];
            if (greatness == 19) {
                output = string(abi.encodePacked('"', name[0], ' ', name[1], '" ', output));
            } else {
                output = string(abi.encodePacked('"', name[0], ' ', name[1], '" ', output, " +1"));
            }
        }
        return output;
    }

    function tokenURI(uint256 tokenId) override public view returns (string memory) {
        string[17] memory parts;
        parts[0] = '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 400 400"><style>.base { fill: #71FF7B; font-family: "Roboto Mono"; font-size: 10px; }</style><rect width="100%" height="100%" fill="#06420D" /><text x="10" y="20" class="base">';

        parts[1] = getWrap(tokenId);

        parts[2] = '</text><text x="10" y="40" class="base">';

        parts[3] = getPaper(tokenId);

        parts[4] = '</text><text x="10" y="60" class="base">';

        parts[5] = getSecond(tokenId);

        parts[6] = '</text><text x="10" y="80" class="base">';

        parts[7] = getFirst(tokenId);

        parts[8] = '</text><text x="10" y="100" class="base">';

        parts[9] = getFormat(tokenId);

        parts[10] = '</text><text x="10" y="120" class="base">';

        parts[11] = getNext(tokenId);

        parts[13] = '</text></svg>';

        string memory output = string(abi.encodePacked(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5], parts[6], parts[7], parts[8]));
        output = string(abi.encodePacked(output, parts[9], parts[10], parts[11], parts[12], parts[13], parts[14], parts[15], parts[16]));
        
        string memory json = Base64.encode(bytes(string(abi.encodePacked('{"name": "Mint #', toString(tokenId), '", "description": "Welcome to the contract. Be healthy, be happy. Do whatever you want with these. WAGMI.", "image": "data:image/svg+xml;base64,', Base64.encode(bytes(output)), '"}'))));
        output = string(abi.encodePacked('data:application/json;base64,', json));

        return output;
    }
    
     function toString(uint256 value) internal pure returns (string memory) {

    
    

        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }


    constructor()
        public
        ERC721("Contract", "CONTRACT") {}


    
    function setBaseURI(string memory _baseURI) 
        external 
        onlyOwner 
    {
        _setBaseURI(_baseURI);
    }


    
    function setContractURI(string memory contractURI_) 
        external 
        onlyOwner 
    {
        _contractURI = contractURI_;
    }


    
    function contractURI() 
        public 
        view 
        returns (string memory) 
    {
        return _contractURI;
    }

    
    function setProvenance(string memory _provenance) 
        external 
        onlyOwner 
    {
        require(
            bytes(provenance).length == 0,
             "Provenance already set!"
             );
        provenance = _provenance;
    }
    
    
    function reup(uint256 quantity) 
        external 
        payable 
    {
        require(
             block.number >= startingBlock,
             "Sale hasn't started yet!"
        );
        require(
            quantity <= maxMintsPerTx,
            "There is a limit on minting too many at a time."
        );
        require(
            nextTokenId -1 + quantity <= maxTokens ,
            "Minting this many would exceed supply."
        );
        require(
            msg.value >= tokenPrice * quantity,
            "Not enough ether sent."
        );
        require(
            msg.sender == tx.origin,
            "No contracts."
        );
        for (uint256 i = 0; i < quantity; i++) {
            _safeMint(msg.sender, nextTokenId++);
        }
    }

    
    function mintSpecial(address [] memory recipients, uint256 [] memory specialId) 
        external 
        onlyOwner 
    {        
        require (!devMintLocked,
            "Dev Mint Permanently Locked"
            );
        for (uint256 i = 0; i < recipients.length; i++) {
            require (specialId[i]!=0);
            _safeMint(recipients[i],specialId[i]*1000000);
        }
    }

    function setStartingBlock(uint256 _startingBlock)
        public
        onlyOwner
    {
        startingBlock=_startingBlock;
    }

    function lockDevMint()
        public
        onlyOwner
    {
        devMintLocked=true;
    }

}
