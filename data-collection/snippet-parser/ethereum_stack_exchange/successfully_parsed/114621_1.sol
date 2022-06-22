contract Case2 {
    Widget[] private widgetList;

    function getLast(uint256 key) {
        Widget storage lastItem = widgetList[widgetList.length - 1];
        widgetList.length--;
        
    }
}
