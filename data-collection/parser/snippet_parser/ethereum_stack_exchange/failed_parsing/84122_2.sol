mapping (address => bool) private hasUpvoted;

function checkForUpvote() external returns(bool) {
    require(!hasUpvoted[msg.sender], 'You already upvoted');

    [... do stuff]

    hasUpvoted[msg.sender] = true;
}
