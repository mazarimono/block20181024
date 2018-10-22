contract Sandwitch {
    uint private sandwichesEaten = 0;
    // eat()という関数を作る。（internalで！)
    function eat() internal {
    sandwichesEaten++;
    }
}

// BLTはSandwitchを継承した
contract BLT is Sandwitch {
    uint private baconSandwichesEaten = 0;
    function eatWithBacon() public returns (string) {
    baconSandwichesEaten++;
// なのでeat()を使える。
    eat();
    }
}