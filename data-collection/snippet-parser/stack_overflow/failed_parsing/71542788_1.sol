contract Blackjack{
    bool exists;

    constructor{
        exists = true;
    }

    function checkExistance() public view returns(bool){
        return exists;
    }
}
