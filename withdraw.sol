contract GetPaid is Ownable {
    function withdraw() external onlyOwner {
    owner.transfer(this.balance);
    }
}

// 多すぎる支払いを返す関数も作れる。    
uint itemFee = 0.001 ether;
msg.sender.transfer(msg.value - itemFee);