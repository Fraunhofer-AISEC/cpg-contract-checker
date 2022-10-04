function showInfo(uint _pesel) public onlyMainPerson(msg.sender) returns (string memory, string memory) {
    string memory x = showName(_pesel);
    string memory y = showDate(_pesel);
    return(x,y);
}

function showName(uint _pesel) private view returns( string memory) {
    return(wills[_pesel].name);
}
function showDate(uint _pesel) private view returns( string memory) {
    return(wills[_pesel].date);
}
