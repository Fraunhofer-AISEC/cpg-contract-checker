enum StateType { Active, Pending, Terminated }

struct StateInfo {
    uint age;
    string firstName;
    string lastName;
}

mapping (string => StateInfo) stateInfos;

var stateInfo = stateInfos[StateType.Active];
