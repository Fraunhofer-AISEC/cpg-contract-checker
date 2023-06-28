struct Review {
    uint rating;
    address reviewer;
    string description;
    uint dateAdded;
}


mapping (uint => Review[]) public ratings;

function rateBook(uint id, uint rating, string comments) onlyMember {
    if (id > numBooks || rating < 1 || rating > 5) {
        throw;
    }

    ratings[id].push(Review({
        rating: rating,
        reviewer: msg.sender,
        description: comments,
        dateAdded: now
        }));
}
