struct MemberItem {
    uint value1;
    ...
    uint value10;
}

struct Item {
    MemberItem memberItem;
    uint itemId;
}

item = Item({memberItem:0}, itemId:0);
