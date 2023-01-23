contract c {
    address owner;

    event Error(string error);

    modifier onlyOwner() {
        if (msg.sender != owner) {
            Error('Mortal: onlyOwner function called by user that is not owner');
        }
        _;
    }

    function c() {
        
        owner = msg.sender;
    }

    function f() onlyOwner {

    }
}
