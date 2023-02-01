pragma solidity ^0.5.7;

contract myContract {
    string myString;

    function setStr(string memory _str) public
    {
        myString = _str;
    }

    function reverseStrMain() public view returns (string memory)
    {
        return reverseStr(myString);
    }

    function reverseStrArg(string memory strIn) public view returns (string memory)
    {
        return reverseStr(strIn);
    }

    function reverseStr(string memory strIn) internal pure returns (string memory)
    {
        bytes memory _myString = bytes(strIn);
        uint256 count = _myString.length;
        uint256 end   = count - 1;
        bytes memory reveresedStr = new bytes(count);

        for (uint256 begin = 0; begin < count; begin++)
            reveresedStr[begin] = _myString[end--];

        return string(reveresedStr);
    }

}
