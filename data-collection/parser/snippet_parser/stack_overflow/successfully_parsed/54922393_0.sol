function buyPlot(uint index) public payable {
    Plot storage plot = plots[index];

    require(msg.sender != plot.owner && plot.forSale && msg.value >= plot.price);

    if(plot.owner == 0x0) {
        balances[owner] += msg.value;
    }else {
        balances[plot.owner] += msg.value;
    }

    plot.owner = msg.sender;
    plot.forSale = false;

    emit PlotOwnerChanged(index);
}
