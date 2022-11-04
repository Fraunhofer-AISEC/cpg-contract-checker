pragma solidity ^0.4.20;
contract StringGas {
    string[] words;
    function StringGas() public {
        words.push("BEGIN");
    }
    function addAWord(string _word) external {
        words.push(_word);
    }
}
