    
    pragma solidity ^0.8.0;
    
    contract Improver {
        struct User {
            string username;
            address _address;
            string profilePic;
            uint id;
        }
    
        struct Activity {
            address owner;
            uint start;
            uint end;
            bool status;
            string activity;
            uint id;
        }
    
        struct Routine {
            Activity[] activities;
            bool areActivitiesAllDone;
            address owner;
            uint id;
        }
    
        User[] public usersArray;
        Activity[] public activityArray;
        Routine[] public routineArray;
        mapping(address => User) public addressToUser;
        mapping(string => User) public nameToUser;
        mapping(address => Activity) public addressToActivity;
        mapping(uint => Activity) public idToActivity;
        mapping(address => Routine) public addressToRoutine;
        mapping(uint => Routine) public idToRoutine;
    
        
        function createActivity(
            uint _start,
            uint _end,
            string memory _activity
        ) public {
            Activity memory newActivity = Activity({
                owner: msg.sender,
                start: _start,
                end: _end,
                status: false,
                activity: _activity,
                id: activityArray.length
            });
    
            addressToActivity[msg.sender] = newActivity;
            activityArray.push(newActivity);
        }

            function createRoutine(uint[] memory activitiesID) public {
        Activity[] memory routineActivities = new Activity[](8);
        bool[] memory activitiesStatus = new bool[](8);
        bool areAllActivitiesDone;

        
        for (uint index; index < activitiesID.length; index++) {
            Activity memory activity = idToActivity[index];
            routineActivities[routineActivities.length] = activity;
        }

        
        for (uint index; index < activitiesID.length; index++) {
            Activity memory activity = idToActivity[index];
            activitiesStatus[activitiesStatus.length] = activity.status;
        }

        
        for (uint index; index < activitiesStatus.length; index++) {
            bool status = activitiesStatus[index];
            if (status == false) {
                areAllActivitiesDone = false;
            } else {
                areAllActivitiesDone = true;
            }
        }

        
        Routine memory newRoutine = Routine({
            activities: routineActivities,
            areActivitiesAllDone: areAllActivitiesDone,
            owner: msg.sender,
            id: routineArray.length
        });

        
        addressToRoutine[newRoutine.owner] = newRoutine;
        idToRoutine[newRoutine.id] = newRoutine;
        routineArray.push(newRoutine);
    }
}

    
   
    }
