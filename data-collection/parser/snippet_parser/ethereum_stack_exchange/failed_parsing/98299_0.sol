Contract Blog {
    struct Post {
        string content;
        bool isDeleted;
    }
    mapping (uint256 => Post) private posts;
    uint256 postCounter = 0;
}
