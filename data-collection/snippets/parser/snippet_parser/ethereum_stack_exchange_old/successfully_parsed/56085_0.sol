contract OPCToken is AccessControl, StandardToken {

    constructor() {
        owner = msg.sender;
     }
}
