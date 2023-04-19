pragma solidity  0.8.10;

contract creditcardassociate {
    uint private cccount = 0;
    function addcreditcardCounter() public{
        cccount += 1;
    }
    function getCount() public view returns (uint){
        return cccount;
    }
    string fullname =""; 
     function _outputassociatenumber () public view returns (string memory) {
       return fullname;
    }
    function _inputAssociatenumber (string memory _s) public {
        fullname= _s;
    }
    uint assoicatecc;
    function _inputthinkccnumber (uint x) public{
        assoicatecc = x;
    }
    function _outputthinkccnumber () public view returns (uint){
        return assoicatecc;
    }
    function checkCreditcards () public view returns (string memory){
        if (assoicatecc = cccount) {
            return "yes";
        }
        else (assoicatecc != cccount); {
            return "no";
        }
    }
}
