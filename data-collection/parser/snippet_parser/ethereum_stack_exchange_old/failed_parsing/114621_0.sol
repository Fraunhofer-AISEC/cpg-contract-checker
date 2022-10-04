contract Case1 {
    mapping(uint256 => Widget) private widgets;

    function delete(uint256 key) {
        Widget storage deletedItem = widgets[key];
        delete widgets[key];
        
    }
}
