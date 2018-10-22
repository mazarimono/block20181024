function sayHiToVitalik(string _name) public returns (string) {
    require(keccak256(_name) == keccak256("Vitalik"));
    return "Hi!";
} 