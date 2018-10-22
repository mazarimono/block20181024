mapping (uint => uint) public age;

modifier olderThan(uint _age, uint _userId) {
    require (age[_userId] >= _age0);
}

function driverCar(uint _userId) public olderThan(18, _userId) {
    
}