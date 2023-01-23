pragma solidity ^0.4.6;

contract Mappings {

    

    struct UserStruct {
        uint balanceOf;
        bool isActive;
        mapping(uint => bool) answerFlags;
    }

    
    

    

    mapping(uint => UserStruct) public userStructs;

    
    

    mapping(uint => bool) public addressFlags;

    

    function setUserStruct(uint key, uint balanceOf, bool isActive) public returns(bool success) {
        userStructs[key].balanceOf = balanceOf;
        userStructs[key].isActive  = isActive;
        return true;
    }

    function setAddressFlag(uint key, bool flagAddress) public returns(bool success) {
        addressFlags[key] = flagAddress;
        return true;
    }

    

    function getUserAnswerFlag(uint userStructKey, uint userAnswerKey) public constant returns(bool answerFlag) {
        return userStructs[userStructKey].answerFlags[userAnswerKey];
    }

    function setUserAnswerFlag(uint userStructKey, uint userAnswerKey, bool setValue) public returns(bool success) {
        userStructs[userStructKey].answerFlags[userAnswerKey] = setValue;
        return true;
    }

}
