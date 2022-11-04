    function changeUserNameAndEmail (
        bytes32 email,
        bytes32 newName,
        bytes32 newEmail
    ) public {
        users[emailToId[email]].name = newName;
        emailToId[newEmail] = emailToId[email];
        delete emailToId[email];
    }
