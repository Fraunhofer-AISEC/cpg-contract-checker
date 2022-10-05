   contract HelloWorld {
    struct Items {
       address id;
       string data;
    }

    mapping(address => Items) items;

    function getItem(address key) returns (string) {
      return items[key].data;
    }

    function addItem (address key, string data) returns (bool) {
        Items item = items[key];
        item.data = data;
    }

   }

 }
