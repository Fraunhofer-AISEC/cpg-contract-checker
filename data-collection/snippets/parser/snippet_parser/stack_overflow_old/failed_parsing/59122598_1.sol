event ErrorLog(string msg);

function this() public {
    Owner = 0x583031D1113aD414F02576BD6afaBfb302140225;
    emit ErrorLog("Error in function this");
    return;
}
