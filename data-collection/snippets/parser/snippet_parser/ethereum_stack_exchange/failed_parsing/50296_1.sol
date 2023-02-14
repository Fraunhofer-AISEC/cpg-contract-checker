function setDailyAssessmentInfo(string _dailyAssessmentId, string _period, string _score) public {
   bool write = false;
   uint score = stringToUint(_score);

   dailyAssessment storage assessment = daily_assesment[_dailyAssesmentId];
   if(assesment.dailyAssesmentId == _dailyAssesmentId)
       {
           assessment.period.push(_period);
           assessment.score.push(score);
           write = true;
       }
