 pragma solidity ^0.4.24;
    contract ThreatActors {

        uint actorAmount = 1;

        struct Actor{
            string labels;
            string aliases;
            string roles;
            string goals;
            string resource_level;
            string sophistication;
            string primary_motivation;
        }

       Actor[] public actors;


    function addActor(string _labels, string _aliases, string _roles, string _goals, string _resource_level, string _sophistication, string _primary_motivation) public
        {
            Actor memory actor = Actor(_labels, _aliases, _roles, _goals, _resource_level, _sophistication, _primary_motivation);

            actors.push(actor);

            actorAmount++;
        }


    function getActor(uint _key) view public returns (string, string, string, string, string, string, string) {
        return (actors[_key].labels, actors[_key].aliases, actors[_key].roles, actors[_key].goals, actors[_key].resource_level, actors[_key].sophistication, actors[_key].primary_motivation);
    }

    function countActors() view public returns (uint) {
        return actors.length;
    }

    }
