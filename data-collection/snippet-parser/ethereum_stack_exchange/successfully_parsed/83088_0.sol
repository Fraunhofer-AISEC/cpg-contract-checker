pragma solidity ^0.6.7;
contract Ballot {

    struct Play {
        uint cod_music;
        uint qtd;
    }

    struct Listener{
        address user;
        Play[] listened;
    }

    Listener[] listeners;
    Play[] tests;

    function listenMusic(uint cod) public {
        tests.push(Play({
            cod_music: cod,
            qtd: 1
        }));

        listeners.push(Listener({
            user: msg.sender,
            listened: tests
        }));
    }
}
