pragma solidity = 0.5.9;

import './Survey.sol';
contract SurveyFactory {

    address[] public surveyList;
    address public Owner;

    constructor() public {
        Owner = msg.sender;
    }

    function createSurvey() public returns(address surveyAddress){
        Survey survey = new Survey();
        surveyList.push(address(survey));
        return address(survey);
    }

    function getSurveyCount() public view returns(uint) {
        return surveList.length;
    }
}
