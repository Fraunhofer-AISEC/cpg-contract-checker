    struct Image {
        uint256 id;
        string hash;
        string description;
        uint256 tipAmount;
        address payable author; 
    }



    function uploadImage(string memory _imageHash, string memory _description) public {

        require(bytes(_imageHash).length > 0, "Must Have Hash!");

        require(bytes(_description).length > 0, "Must have description");

        require(msg.sender != address(0), "Must have author address");

        imageCount++;

        images[imageCount] = Image(
            imageCount,
            _imageHash,
            _description,
            0,
            msg.sender 
        );

        emit ImageCreated(imageCount, _imageHash, _description, 0, msg.sender);
    }
