contract OnlineStore {
    funcion buySomething() external payable {
    require(msg.value == 0.001ether);
    transferTinh(msg.sender)
    }
}