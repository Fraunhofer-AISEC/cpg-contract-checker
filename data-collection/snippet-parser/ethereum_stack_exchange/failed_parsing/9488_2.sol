self.head = Node({prev: None, next: None, data: 10,});

uint addr;
assembly {
    addr := self.head   
}
