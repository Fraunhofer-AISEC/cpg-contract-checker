struct dailyAssessment{
    string dailyAssessmentId;
    string[] period;
    uint[] score;
    uint averageScore;
}

function getDailyAssessmentInfo(string _id) returns (uint){
   return daily_assessment[_id].averageScore;
}

function setDailyAssessmentInfo(string _dailyAssessmentId, string _period, uint _score) public {
   uint average = daily_assessment[_dailyAssessmentId].averageScore;
   uint N = daily_assessment[_dailyAssessmentId].score.length;

   uint newAverage = (average * N + _score) / (N + 1);
   daily_assessment[_dailyAssessmentId].averageScore = newAverage;
}