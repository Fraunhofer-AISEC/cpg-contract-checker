function AddVisitDate (uint _date, uint _SecretNum ) public {
           dates[_SecretNum].push(visitDates(_date));
       } 
