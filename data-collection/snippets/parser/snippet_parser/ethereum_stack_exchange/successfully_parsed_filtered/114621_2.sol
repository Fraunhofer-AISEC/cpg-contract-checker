contract Case3 {
    Widget[] private widgetList;

    function getLast(uint256 key) {
        Widget storage lastItem = widgetList[--widgetList.length];
        
    }
}
