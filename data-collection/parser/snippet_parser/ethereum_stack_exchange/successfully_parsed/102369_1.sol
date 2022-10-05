constructor() public ERC721Full("TwoPeopleAgreement", "TWOPEOPLEAGREEMENT") {
    owner = msg.sender;
}

function mint(
    People memory _people1,
    People memory _people2,
    Image memory _picture
) public payable {
    require(!_peopleExists[_people1.uuid]);
    require(!_peopleExists[_people2.uuid]);

    signature(msg.sender);
    require(ownersArr.length == 2);

    uint256 _id = peoples.push(_people1);
    uint256 _id2 = peoples.push(_people2);
    picture.push(_picture);
    _peopleExists[_people1.uuid] = true;
    _peopleExists[_people2.uuid] = true;

    nonce = nonce + 1;



    _mint(msg.sender, _id + _id2);
    sendtoOwner(msg.value);
}
