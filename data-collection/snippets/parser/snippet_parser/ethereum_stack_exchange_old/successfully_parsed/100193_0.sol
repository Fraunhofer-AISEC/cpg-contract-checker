contract A{

    address[] public owners;
    uint public numConfirmationRequired;    
    modifier onlyOwner () {
        require(isOwner[msg.sender], 'not owner');
        _;
    }
    mapping(address => bool) public isOwner;

    constructor(address[] memory _owners)public{
       for (uint i = 0; i < _owners.length; i++) {
            address owner = _owners[i];
            require(owner != address(0), 'invalid owner'); 
            require(!isOwner[owner], 'owner not unique'); 
            isOwner[owner] = true;
            owners.push(owner);           
        }
    }

    function() payable external {
        emit Deposite(msg.sender, msg.value, address(this).balance);
    }
}
