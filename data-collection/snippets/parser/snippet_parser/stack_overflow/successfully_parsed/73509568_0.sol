pragma solidity ^0.8.16;


contract Quiz{

struct Question{
    string statement;
     string[4] options;
    uint correctIndex;
}

    Question[] questions;


    constructor() payable{
        addQuestions();
    }


    function addQuestions()public payable{
         questions.push(Question("Who is the CEO of Pakistan?", ["Shehbaz Sharif","Gen. Bajwa","Imran Khan","Zardari"], 1));
         questions.push(Question("Capital of Pakistan?", ["Lahore","Quetta","Karachi","Islamabad"], 3));
         questions.push(Question("When android acquried firebase offically?", ["2011","2014","2013","2015"], 1));
         questions.push(Question("Advantages of decentralized App?", ["Speed, efficiency and accuracy","Trust and transparency","Savings","All of these"], 3));
         questions.push(Question("What are the application of smart contracts?", ["retailer-supplier","Trade Efficency","Trust","All of these"], 3));
    }

    function getQuestions()public view returns(Question[] memory){
        Question[] memory questionList = new Question[](5);
        for (uint i = 0; i < 5; i++) {
          Question storage question = questions[i];
          questionList[i] = question;
        }
        return questionList;
    }

    

    function checkQuestion(uint qIndex, uint choosedAnsIndex)public view returns(bool){
        Question memory question = questions[qIndex];

        if(question.correctIndex == choosedAnsIndex){
            return true;
        }

        return false;
    }



}
