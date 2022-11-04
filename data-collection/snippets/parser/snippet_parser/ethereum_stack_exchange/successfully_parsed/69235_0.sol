contract Passport
{
    struct      Person
    {
        string  name;
        string  surname;
        uint8   age;
        uint256 id;
        bool    registered;
    }

    address payable public              owner;
    mapping(address => Person) public   people;
    uint256                             idCount;

    modifier ownerOnly()
    {
        require(msg.sender == owner);
        _;
    }

    constructor() public payable
    {
        owner = msg.sender;
    }

    function registerID(string memory _name, string memory _surname, uint8 _age) public
    {
        require(!people[msg.sender].registered);

        people[msg.sender].name = _name;
        people[msg.sender].surname = _surname;
        people[msg.sender].age = _age;
        people[msg.sender].id = idCount;

        people[msg.sender].registered = true;

        idCount += 1;
    }

    
    function isRegistered(address _address) public view returns (bool)
    {
        return people[_address].registered;
    }

    function end() ownerOnly public
    {
        selfdestruct(owner);
    }
}
