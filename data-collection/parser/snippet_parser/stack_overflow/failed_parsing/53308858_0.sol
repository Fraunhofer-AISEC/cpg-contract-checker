    if (contractBalance < 100 ether) {
        return (20);
    }
    if (contractBalance >= 500 ether && contractBalance < 1000 ether) {
        return (40);
    }
    if (contractBalance >= 1000 ether && contractBalance < 2000 ether) {
        return (60);
    }
    if (contractBalance >= 2000 ether) {
        return (80);
    }
