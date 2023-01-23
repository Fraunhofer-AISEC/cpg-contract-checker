struct Input{
    uint256 gettid;
    string title1;
    string title2;
    string title3;
    string title4;
    string title5;
}
Input[] public inputsArray;

function gettid() public view returns(uint256) {
return inputsArray.length;
}

function addinput(
    uint256 _gettid,
    string memory _title1,
    string memory _title2,
    string memory _title3,
    string memory _title4,
    string memory _title5
    
) public {
    inputsArray.push(Thread(_gettid, _title1, _title2, _title3, _title4, _title5));
}}
