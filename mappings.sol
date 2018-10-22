// アカウントの残高にuintを格納する

mapping (address => uint) public accountBalance;

// ユーザーidを基にユーザーの名前を参照格納する場合

mapping (uint => string) userIdToName;

// 前がキー、後がバリュー。型を指定している感じ。

