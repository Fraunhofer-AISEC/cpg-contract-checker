Action[] actions;

for (uint i = 0; i < actions.length; i++) {
    if (actions[i].createdAt < now - 1000) {
        if (actions[i].actionType == A) {do something with the string field}
        if (actions[i].actionType == B) {do something with the bool field}
        if (actions[i].actionType == C) {do something with the int field}
    }
}
