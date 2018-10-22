
### blockchain Kyoto#08

#### CryptoZombies, EOS

##### Hideyuki Ogawa 
###### Chomoku CEO
---    
### 本日のお題
1 CryptoZombie   

2 EOS

---     
### CryptoZombie
#### どんなものか？    
イーサリウムでゾンビゲームを作りながらSolidityを学ぶ。     
全部コードを入力するわけでなく、空いてるところに入れる感じ。     
https://cryptozombies.io/en/course/     
      
* こんな感じで作れるのかぁとか思うには良い。     
* いろいろな知識が仕入れられる。     

---
### どんな知識？？(1)
* 関数はデフォルトでpublic。誰でも呼び出せる。    
* コントラクトが誰でも呼び出せ、攻撃に対して脆弱になる。 => privateにする(コード例：下)          
* 戻り値(returns)、関数の修飾子も関数の後に加える 
* 戻り値(returns): 戻り値の方を書いておく。          
* view修飾子: ブロックチェーンからデータを読み込みのみできる。
* pure修飾子: ブロックチェーンから読み込みも書き込みもできない。トランザクションを発生させない。            
+++?code=private_sample.sol
* private関数事例      

+++?code=solidity-pure-view.sol
* 戻り値
 
---

### どんな知識？？(2)
* 乱数はハッシュ関数(keccak256())を使って発生させる。    
* ブロックチェーンでの安全な乱数の発生は非常に難しい課題。ハッシュ関数を使っての乱数発生は安全なものではないが、ゾンビのDNA生成にはこれで十分。    
* eventは、何かが起こった時にイベントを発生させることができる。     
     
+++?code=random.sol
+++?code=event.sol

### どんな知識？？(2)
#### データ型 addressとMappings
* address / 言わずと知れた
* Mappings / データを格納するときに使える方法の一つ。キーバリューストア     
      
+++?code=mappings.sol