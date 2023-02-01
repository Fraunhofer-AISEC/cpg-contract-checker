contract MyContract {
    event MyWorkingEvent(
        address thing4,
        address thing5,
        address thing6);

    event MyBrokenEvent(
        address indexed thing1,
        address thing2,
        address thing3);

    function logAllTheThings(){
        MyWorkingEvent(0x12, 0x34, 0x56); 
        

        MyBrokenEvent(0x12, 0x34, 0x56); 
        
    }
}
