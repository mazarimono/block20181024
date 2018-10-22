// とあるコントラクト
contract LuckyNumber {
    mapping(address => uint) numbers;

    function setNum(uint_num) public {
    numbers[msg.sender] = _num;
    }

    function getNum(address _myAddress) public view returns (uint{
    return numbers[_myAddress]
    })
}
// 別コントラクト
contract NumberInterface {
    function getNum(address _myAddress) public view returns (uint);
}
