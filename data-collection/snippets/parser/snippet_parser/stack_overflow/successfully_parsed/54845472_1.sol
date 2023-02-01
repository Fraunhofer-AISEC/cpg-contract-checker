bool foundSkill = false;

for (uint i = 0; i < developers_all[h].skills.length; i++) {
    if (developers_all[h].skills[i] == _skill) {
        developers_all[h].skill_levels[i]++;
        foundSkill = true;
        break;
    }
}

if (!foundSkill) {
    developers_all[h].skills.push(_skill);
    developers_all[h].skill_levels.push(1);
}
