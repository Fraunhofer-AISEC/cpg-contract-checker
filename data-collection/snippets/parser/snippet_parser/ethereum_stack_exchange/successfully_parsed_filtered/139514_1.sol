import "https://github.com/Arachnid/solidity-stringutils/blob/master/src/strings.sol";

contract StringManipulation {
    using strings for *;

    string endpoint = 'https://api.sportsdata.io/v3/nba/scores/json/TeamGameStatsByDate';
    string key = '/YOUR_KEY';

    function createString(string memory dateString) public view returns(string memory uri) {
        strings.slice[] memory stringArr = new strings.slice[](3);
        stringArr[0] = endpoint.toSlice();
        stringArr[1] = dateString.toSlice();
        stringArr[2] = key.toSlice();
        uri = strings.join(''.toSlice(),stringArr);           
    }
}
