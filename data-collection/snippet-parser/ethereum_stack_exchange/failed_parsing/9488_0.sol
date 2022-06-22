library LinkedList {
    uint80 constant None = uint80(0); 

    struct data {
        Node head;
        Node[] node_array;
    }

    struct Node {
        string data;
        uint80 prev;
        uint80 next;
    }

    function initialize(data storage self){
        self.head = Node({prev: None, next: None, data: "",});
        self.head.next = 
    }        
}
