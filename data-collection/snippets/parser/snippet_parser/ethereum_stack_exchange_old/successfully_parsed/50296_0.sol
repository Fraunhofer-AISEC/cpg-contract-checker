pragma solidity ^0.4.21;

contract DailyAssessmentScoreContract {

   struct dailyAssessment{
        string dailyAssessmentId;
        string[] period;
        uint[] score;
    }
    dailyAssessment[] daily_assessment;


   function stringsEqual(string storage _a, string memory _b) internal returns (bool) {
        bytes storage a = bytes(_a);
        bytes memory b = bytes(_b);
        if (a.length != b.length)
            return false;
        
        for (uint i = 0; i < a.length; i ++)
            if (a[i] != b[i])
                return false;
        return true;
    }
    function stringToUint(string s) constant returns (uint result) {
        bytes memory b = bytes(s);
        uint i;
        result = 0;
        for (i = 0; i < b.length; i++) {
            uint c = uint(b[i]);
            if (c >= 48 && c <= 57) {
                result = result * 10 + (c - 48);
            }
        }
    }

   function setDailyAssessmentInfo(string _dailyAssessmentId, string _period, string _score) public {
       bool write = false;
       uint score = stringToUint(_score);
       for(uint i=0; i<=daily_assessment.length; i++)
       {                                                                                                                                                                                                                                                            
           if(stringsEqual(daily_assessment[i].dailyAssessmentId, _dailyAssessmentId))
           {
               daily_assessment[i].period.push(_period);
               daily_assessment[i].score.push(score);
               write = true;
           }
       }
       if(write==false)
        {
            daily_assessment[i].dailyAssessmentId=_dailyAssessmentId;
            daily_assessment[i].period.push(_period);
            daily_assessment[i].score.push(score);
        }
   }

   function getDailyAssessmentInfo(string _dailyAssessmentId) public constant returns (uint) {
       uint score;
       for(uint i=0;i<=daily_assessment.length;i++)
       {
           if(stringsEqual(daily_assessment[i].dailyAssessmentId, _dailyAssessmentId))
           {
               uint sum = 0;
               uint scoreLength = daily_assessment[i].score.length;
               for(uint j=0;j<=scoreLength;j++)
               {
                    sum = sum + daily_assessment[i].score[j];
               }
                score = sum / scoreLength;
           }
       }

       return (score);
   }   
}
