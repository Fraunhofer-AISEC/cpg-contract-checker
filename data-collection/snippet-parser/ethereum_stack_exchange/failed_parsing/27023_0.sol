pragma solidity ^0.4.11;


contract RaceParticipants {

    struct Participants {

        bytes32 id;
        bytes32 name;
        uint age;
        bool isValue;

    }

    mapping (bytes32 => Participants)  participantsMap;

    bytes32[] participantsKey;


    event LogParticipants (bytes32 id, bytes32 name, uint age);

    function ListRegisteredParticipants () {

        for (.....) {

            LogParticipants (id, name, age);

        }


    }

    function DeleteRegisteredParticipants (bytes32 _id) 
        returns (bool flag) {

        if (participantsMap[_id].isValue) {

            delete participantsMap[_id];

            return true;

        }

        return false;

    }

    function RegisterParticipants (bytes32 _id, bytes32 _name, uint _age) returns (bool flag) {

        if (!participantsMap[_id].isValue) {

            participantsMap[_id].id = _id;
            participantsMap[_id].name = _name;
            participantsMap[_id].age = _age;
            participantsMap[_id].isValue = true;

            participantsKey.push(_id);

            return true;

        }

        return false;

    }

}
