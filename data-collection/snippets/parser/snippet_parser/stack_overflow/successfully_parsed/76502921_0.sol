    struct Vote {
        address payable validator;
        VoteType evaluation;
    }

    struct Attribute {
        Vote[3] votes;
        string name;
    }

    struct ImageData {
        Attribute[] attributes; 
        bool exists;
    }

    mapping(bytes32 => ImageData) images;

    function addAttribute(bytes32 _imgHash, string memory _attribute) external returns(uint256) {
        require(msg.sender == owner, "Only owner can add images");
        ImageData storage image = images[_imgHash];
        Attribute memory newAttribute;
        newAttribute.name = _attribute;
        images[_imgHash].attributes.push(newAttribute);
        return (image.attributes.length - 1);
    }
