pragma solidity ^0.4.18;

contract HelloContract {
    string word = "Hello World!";

    function getWord() constant returns (string) {
        return word;
    }

    function setWord(string newWord) returns (string) {
        word = newWord;
        return word;
    }
}
