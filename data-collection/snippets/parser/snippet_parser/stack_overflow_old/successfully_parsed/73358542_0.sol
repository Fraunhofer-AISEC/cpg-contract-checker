pragma solidity >=0.7.0 <0.9.0;

    struct Universe{
        uint256 year;
        uint64[3] space;        
    }

contract myContract {

    mapping(address => Universe) public myUni;
    
    function setSomething(uint256 _year, uint64[3] memory _space) public {
            Universe memory testUni = Universe({
            year: _year,
            space: _space
        });
        myUni[msg.sender] = testUni;
    }
}
