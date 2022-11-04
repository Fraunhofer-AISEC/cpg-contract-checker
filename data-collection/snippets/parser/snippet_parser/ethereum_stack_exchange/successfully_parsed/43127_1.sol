uint counter;

mapping (uint => string) public comments;

function addComment(string newComment) public {
    comments[counter + 1](newComment);
    comments[counter].nextItem = counter + 1;
}

function removeCommentWithId(uint commentId) public {
    comments[commentId - 1].nextItem = commentId + 1;
}
