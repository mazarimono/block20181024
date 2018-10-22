
### blockchain Kyoto#08

#### CryptoZombies, EOS

##### Hideyuki Ogawa 
###### Chomoku CEO
---    
### 本日のお題
1 CryptoZombie   

2 EOS     
      
3 TRUST    
---   
### 参考ページ
* CryptoZombie    
https://cryptozombies.io/     
* Solidity   
https://solidity.readthedocs.io/en/v0.4.25/index.html     
* EOS     
https://developers.eos.io/      
---

### CryptoZombieどんなものか？    
ゾンビゲームを作りながらSolidityを学ぶ。     
全部コードを入力するわけでない。     
https://cryptozombies.io/en/course/     
      
* Loom networkというethreumのlayer2でDPOSのサイドチェーンを作っているプロジェクトが運営。EOS on Ethreumとか言っているｗ　     
* めちゃスケールできるゲームとかdappを作れるよー。　　　　 
* SolidityはJavascriptに似ているらしい（あんまり書いたことないので・・・）    
* こんな感じで作れるのかぁとか思うには良い。     
* いろいろな知識が仕入れられる。     

---
### どんな知識？？(1)
#### contract内にコードを！     
* コードはcontract内にカプセル化されている。    
* 変数や関数はすべてコントラクトに属する。     
      
+++?code=hello_solidity.sol    

### どんな知識？？(2)
* 関数はデフォルトでpublic。誰でも呼び出せる。    
* コントラクトが誰でも呼び出せ、攻撃に対して脆弱になる。 => privateにする(コード例：下)         
* internalとexternal     
* internalはprivateと同じだけど、コントラクトを継承したコントラクトからは関数にアクセスできる！     
* publicはコントラクトの内部・外部ともに呼び出せる。externalは外部から呼び出せるのみ。    
+++?code=private_sample.sol      
* private使用例     
+++?code=internal.sol
* internal使用例

---
### どんな知識？？(3)
* 戻り値(returns)、関数の修飾子も関数の後に加える 
* 戻り値(returns): 戻り値の方を書いておく。          
* view修飾子: ブロックチェーンからデータを読み込みのみできる。ブロックチェーン上で何もしない。外部から呼び出される場合ガスなし。関数から呼び出されて使われるとガス必要。     
* pure修飾子: ブロックチェーンから読み込みも書き込みもできない。トランザクションを発生させない。            

+++?code=solidity-pure-view.sol
* 戻り値     
 
---

### どんな知識？？(4)
* 乱数はハッシュ関数(keccak256())を使って発生させる。    
* ブロックチェーンでの安全な乱数の発生は非常に難しい課題。ハッシュ関数を使っての乱数発生は安全なものではないが、ゾンビのDNA生成にはこれで十分。    
* eventは、何かが起こった時にイベントを発生させることができる。     
* 安全な乱数発生に関する議論    
https://ethereum.stackexchange.com/questions/191/how-can-i-securely-generate-a-random-number-in-my-smart-contract      
+++?code=random.sol
+++?code=event.sol

---

### どんな知識？？(5)
#### データ型 addressとMappings
* address / 言わずと知れた
* Mappings / データを格納するときに使える方法の一つ。キーバリューストア     
      
#### msg.sender
* 全ての関数で利用できるグローバル変数の一つ。     
参考：Units（お金の単位）とグローバル変数  https://solidity.readthedocs.io/en/v0.4.25/units-and-global-variables.html      
* これを利用すると、関数を呼び出したユーザーのaddressを参照できる。      
* solidityは外部の呼び出し元から関数を実行するとの決まりがある。関数を呼び出すまでコントラクトはブロックチェーンに何もしない。     

+++?code=mappings.sol
+++?code=msgsender.sol

---
### どんな知識？？(6)
#### require 
* 条件が違えばエラーを返す。     
     
#### 変数の格納
* storageとmemoryの二つがある。    
* storageはブロックチェーン上に永久に格納される変数。    
* 多くの場合はsolidityが勝手に判断する。     
* 状態変数はデフォルトでstorageに、関数内変数はmemoryに。     

+++?code=require.sol
* この例だと_nameのところに"Vitalik"と入力されればHiと返す。     

---
### どんな知識？？（７）
#### 別コントラクトとのやり取り
* interfaceを宣言すると、別コントラクトの関数が読み込める。   
     
+++?code=interface.sol　　　　
　　　　
---
### どんな知識？？（８）
#### contracts
* contractをethereum上にデプロイすると編集も更新もできなくなる。    
* 修正する方法はなく、別のスマートコントラクトを使うようにユーザーに伝えないといけない。      
* 外部のcontractを使った場合、それが影響した地留守の出、その影響を受けないように作る。    

#### ownableコントラクト
* Ownable / 特別な権限を持つオーナーのみアドレスの更新ができるライブラリ。OpenZepplinのライブラリ。     
* onlyOwner / 修飾子。
https://github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/ownership/Ownable.sol
---

### どんな知識？？（９）
#### OpenZepplin / コミュニティの検証を経た安全なスマートコントラクト。Crowdsalesに関しても安全なコードが記載されている。        
https://openzeppelin.org/     
https://openzeppelin.org/api/docs/learn-about-crowdsales.html     
<br>
#### ガス
* ethereumではファンクションを実行するたびに、ガスと呼ばれる通貨を支払うことになっています。    
* 実行に必要なガス量はそれを実行するためにどのくらいの計算資源が必要かに左右される。     
* 例えばstorageへの操作は高コストなので、
* というわけで無駄のないコードを作り、コストカットを目指すのがsolidityの正しい書き方！     
gas tracker: https://etherscan.io/gastracker     
     
---
### どんな知識？？（10）
#### modifier        
* 修飾子を作る。    

#### payable
* Etherを受け取ることのできる関数     

+++?code=modifier.sol
* modifierで独自の修飾子を作り、関数に渡した。引き数も設定できる。    
+++?code=payable.sol
* msg.value / コントラクトにEtherが送られた金額を見る。     
* 関数にpayable修飾子がなく、Etherをweb3.jsから送ろうとする場合、その関数はトランザクションを拒否する。     
      
---
### どんな知識？？（11）
#### 引き出し関数 transfer
* コントラクトに送られたEtherを引き出す。     

+++?code=withdraw.sol
* this.balanceはコントラクトに存在する残高の総量。     

---

### どんな知識？？（12）
#### トークンについて
* イーサリウム上のトークンは、基本的にいくつかのルールに従ったスマートコントラクトです。     
* トークンは誰がどれくらい所有しているかを記録するコントラクト、ユーザーが自分のトークンを他のアドレスに送ることができる機能が付いている。    

#### ERC20トークン   
* 固有の機能がないため、一つのトークンが扱えると、他の同規格のトークンもコントラクトアドレスをデータベースに追加するだけで取り扱える。    
* 誤ってコントラクトアドレスにトークンを送金すると、トークンを動かせなくなり、使えなくなる。    

#### コントラクトアドレス 
* 契約内容を実行するアドレス     
* コントラクト　=> ブロックチェーンに書き込み => コントラクトの内容を実行    
     
---

### どんな知識？？（13）
#### ERC223トークン      
* コントラクトに対応していないトークンがコントラクトアドレスに送金された際は、元の送り主に自動的に返金する。ERC20トークンの問題点を解決。    

#### ERC721トークン
* ノンファンジブル(代替不可能)トークン。     
* 様々なデータを含むことができる。例えば、クリプトキティ。     
    
* そういえばPEPE CASHとかあったなぁ（遠い目      
     
---

### どんな知識？？（13）
#### ERC721トークンの移動のロジック      
* 2つの異なる移転の方法を持つ。    
    
+++?code=token_transfer.sol     
* 1 トークン所有者が送り先(address)、送りたいトークン(uint256)をtransfer関数を使って送る。     
* 2 approveを使って1と同様のことを行う。誰がトークン受け取りを許可されたのかがmapping (uint => address)にてコントラクトに記録。さらに,
トークンの受け手がtakeOwnership関数を呼び出し。msg.senderが所有者からトークンの受け取りを許可されているか確認し、承認済みの場合は受け手にトークンを送る。     
      
---

### どんな知識？？（14）
#### スマコンのセキュリティ　
##### オーバーフロー
```
uint8 number = 255;
number++;
```
* 255 => 0になる的な・・・     
##### アンダーフロー
```
uint8 number = 0;
number--;
```
* 0 => 255になる的な・・・      
==> OpenZeppelinのライブラリ、SafeMathで解決や！      
---

### どんな知識？？（15）
#### コメント
// 1行コメント、　/* 複数行コメント      
netspec  ///のあとに    
@title 、 @authorはそのままの意味、@noticeはユーザー向け、@devは開発者向けの更なる解説。
　@param、　@return　関数の各＠パラメーターについて記述。    

---

### どんな知識？？（15）
#### web3.js
* ユーザーがDAppとやり取りできるベーシックなウェブページを作る際に使うJavascriptのライブラリ。    
* DAppを運営するのに、自分でノードを運用する必要はなく、サードパーティーの<b>Infura</b>を使うと良い。     
* API経由で利用可能。      
* ユーザーが秘密鍵で署名する必要性が・・・　＝＝＞　自分で管理しない。有名なのは<b>Metamask</b>!     
* MetamaskはChromeとFirefoxのブラウザ拡張機能で、ユーザはアカウントと秘密鍵を安全に管理し、そのアカウントをWeb3jsを使っているウェブサイトとやり取りすることが可能。 ==> ブラウザ拡張機能使いたくないなぁ・・・    

---

### web3.js
https://web3js.readthedocs.io/en/1.0/   
### infura   
https://infura.io/     
### metamask
https://metamask.io/    

### solidity
https://solidity.readthedocs.io/en/v0.4.25/common-patterns.html    
### openzeppelin 
https://openzeppelin.org/    
### eth gas station
https://ethgasstation.info/index.php    
---
