struct Developer {
    address owner;
    string name;
    bytes32 namehash;
    bytes32[] skills;
    uint256[] skill_levels;
    uint wallet;
}

mapping (bytes32=>Developer) public developers_all;

function train(string _name, bytes32 _skill) public {
    bytes32 h = keccak256(abi.encodePacked(_name));

    require(developers_all[h].owner == msg.sender, "Only the owner of the developer can train them");
    require(developers_all[h].wallet >= 150, "Insufficient funds");

    uint256 i = 0; 

    do {
        if (developers_all[h].skills[i] == _skill) {
            developers_all[h].skill_levels[i]++;
        } else if ((i == (developers_all[h].skills.length - 1)) || (developers_all[h].skills.length == 0)) {
            developers_all[h].skills.push(_skill);
            developers_all[h].skill_levels.push(1);
        }
        i++;
    } while (i < developers_all[h].skills.length);

    developers_all[h].wallet = developers_all[h].wallet - 150;
}
