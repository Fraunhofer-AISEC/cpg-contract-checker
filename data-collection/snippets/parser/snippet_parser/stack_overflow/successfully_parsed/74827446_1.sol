Group storage group = groups.push();
group.name = groupName;
group.members = new address[](1);
group.members[0] = msg.sender;
