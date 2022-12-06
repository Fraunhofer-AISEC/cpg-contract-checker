contract SuperContract {
    uint[] public SuperArrayForExample;

    function addItemToArray(uint item) payable {
       SuperArrayForExample.push(item);
    }
}
