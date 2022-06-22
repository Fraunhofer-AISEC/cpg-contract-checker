function publishEtherBox(...) ... {
    ...
    emit EtherBoxPublished(msg.sender, nicknames[msg.sender], etherBoxAddress, _label, now);
    if (msg.value > 0) {
        owner.transfer(msg.value);
    }
}
