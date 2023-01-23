
bool whiteList_ok = false;
for (uint256 i = 0; i == whiteList.length; i++) {
    if (msg.sender == whiteList[i]) {
        whiteList_ok = true;
    }
}
