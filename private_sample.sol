
// 可変長配列を作る。

uint[] numbers;

// プライベート関数：関数名の後にprivateとつける。
　 関数はアンダースコアで始めるのが通例。

function _addToArray(uint _number) private {
    numbers.push(_number)
}