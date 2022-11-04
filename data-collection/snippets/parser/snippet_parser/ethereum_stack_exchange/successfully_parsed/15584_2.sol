function ratings(uint arg1, uint arg2) returns (uint rating, address reviewer, string description, uint dateAdded) {
    rating = ratings[arg1][arg2].rating;
    reviewer = ratings[arg1][arg2].reviewer;
    description = ratings[arg1][arg2].description;
    dateAdded = ratings[arg1][arg2].dateAdded;
}
