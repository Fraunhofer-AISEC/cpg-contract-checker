interface Game{
    function depositPlayer(uint256 _pid, uint256 _amount) external payable;

function myGame(address _reciever) external payable {
    addressBoard = payable(_reciever);
    myGameContract= Game(addressBoard );
    myGameContract.depositPlayer(0, msg.value)();
