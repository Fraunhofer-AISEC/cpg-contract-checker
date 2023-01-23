struct Queue {
    string value;
    bool deleted;
}

Queue[] public listOfItems;

function deleteItem(uint index) public {
    Queue[index].deleted = true;
}
