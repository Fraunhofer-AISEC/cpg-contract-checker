contract lister {
    mapping(int => string) list;
    int id = 0;
    
    function getList() returns (  ) {
        return list;
    }

    function setItemToList(string str) {
        list[id] = str;
        id++;
    }
}
