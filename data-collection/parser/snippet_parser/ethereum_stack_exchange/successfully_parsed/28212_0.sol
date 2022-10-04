struct Activity {
    string name;
    uint8 durationInDaysMinusOne;
}
mapping ( uint => Activity) activities;

function storeActivity(uint uid, string name, uint8 durationInDays) {
   Activity storage activity = activities[uid];
   activity.name = name;

   require(durationInDays > 0);

   if(durationInDays > 1) {
      activity.durationInDaysMinusOne = durationInDays - 1;
   }
}
