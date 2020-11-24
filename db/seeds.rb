# ユーザー
User.create!(
  [
    {
      name: "丸山 健太",
      email: "maruyama@example.com",
      password: "foobar",
      password_confirmation: "foobar",
      admin: true,
    },
    {
      name: "横川 香奈江",
      email: "yokogawa@example.com",
      password: "password",
      password_confirmation: "password",
    },
    {
      name: "採用 太郎",
      email: "recruit@example.com",
      password: "password",
      password_confirmation: "password",
    },
  ]
)

# フォロー関係
user1 = User.find(1)
user2 = User.find(2)
user3 = User.find(3)
user3.follow(user1)
user3.follow(user2)

#　商品
description1  = "表紙にシールと傷あり。無地のリフィルが1冊入っています。サイズは小さいので持ち運びに便利です。"
description2  = "créerの可変式ダンベルです。2.5kgから24kgまで調節可能です。数回しか使っていません。"
description3  = "綺麗な状態です。電子レンジOKです。取っ手が大きくて持ちやすいです。"
description4  = "PRISONERのグリースです。いただいたのですが使わないので譲ります。"
description5  = "留め具付きのメガネケースです。メガネクロスは付いていません。素材は牛革です。"
description6  = "どんぐりで作った置き物です。趣味で作っているのですが、とても可愛く出来たのでもらってくれる方がいたら嬉しいです。"
description7  = "栃の実とどんぐりを使った可愛い置き物です。趣味で作っているのですが、とても可愛く出来たのでもらってくれる方がいたら嬉しいです。"
description8  = "紙粘土で作った子犬のオーナメントです。鉢植えにぶら下げると可愛いです。油性の絵の具で色を塗っても楽しめます。"
description9  = "娘とお揃いで使っていましたが、新しく買い替えたので譲ります。1度手洗いしてるので綺麗です。"
description10 = "手前の青いカードが5枚、奥の花柄カードが5枚の計10枚セットです。オーストラリアに行った時に買いましたが、使い切らないので譲ります。ネパールでハンドメイドした物です。"
description11 = "Varterのロゴが入った半袖Tシャツです。ノベルティでいただいたのですが、サイズが大きかったので譲ります。サイズはメンズのMサイズです。"
description12 = "Varterのロゴが入った半袖Tシャツです。ノベルティでいただいたのですが、サイズが大きかったので譲ります。サイズはメンズのLサイズです。"
description13 = "Varterのロゴが入ったトートバッグです。コットン100%でA4サイズの書類も入ります。底はマチ15cmです。"
description14 = "Varterのロゴが入ったパーカーです。数回着ましたが、サイズが合わなかったです。メンズのSサイズです。"
description15 = "Varterのロゴが入ったキッズ(100cm)サイズの半袖Tシャツです。男女兼用で綿100%です。"

## 3ユーザー、それぞれ5商品ずつ作成
Item.create!(
  [
    {
      name: "【中古】トラベラーズノート",
      user_id: 1,
      description: description1,
      picture: open("#{Rails.root}/public/images/item1.jpg"),
      keywords_attributes: [
                             { name: "ノート" },
                             { name: "旅" },
                             { name: "旅行" },
                             { name: "思い出" },
                             { name: "世界" },
                             { name: "ブラウン" },
                             { name: "" },
                             { name: "" },
                             { name: "" },
                             { name: "" }
                           ],
    },
    {
      name: "【手作り】どんぐりの工作",
      user_id: 2,
      description: description6,
      picture: open("#{Rails.root}/public/images/item6.jpg"),
      keywords_attributes: [
                             { name: "どんぐり" },
                             { name: "工作" },
                             { name: "手作り" },
                             { name: "かわいい" },
                             { name: "置き物" },
                             { name: "子供" },
                             { name: "" },
                             { name: "" },
                             { name: "" },
                             { name: "" }
                           ],
    },
    {
      name: "【新品】Tシャツ(ホワイト)",
      user_id: 3,
      description: description11,
      picture: open("#{Rails.root}/public/images/item11.jpg"),
      keywords_attributes: [
                             { name: "Varter" },
                             { name: "Tシャツ" },
                             { name: "ホワイト" },
                             { name: "半袖" },
                             { name: "ロゴ" },
                             { name: "シンプル" },
                             { name: "" },
                             { name: "" },
                             { name: "" },
                             { name: "" }
                           ],
    },
    {
      name: "【ほぼ新品】可変式ダンベル",
      user_id: 1,
      description: description2,
      picture: open("#{Rails.root}/public/images/item2.jpg"),
      keywords_attributes: [
                             { name: "ダンベル" },
                             { name: "筋トレ" },
                             { name: "トレーニング" },
                             { name: "可変式" },
                             { name: "créer" },
                             { name: "ブラック" },
                             { name: "" },
                             { name: "" },
                             { name: "" },
                             { name: "" }
                           ],
    },
    {
      name: "【手作り】木の実の置き物セット",
      user_id: 2,
      description: description7,
      picture: open("#{Rails.root}/public/images/item7.jpg"),
      keywords_attributes: [
                             { name: "どんぐり" },
                             { name: "木の実" },
                             { name: "手作り" },
                             { name: "かわいい" },
                             { name: "置き物" },
                             { name: "子供" },
                             { name: "" },
                             { name: "" },
                             { name: "" },
                             { name: "" }
                           ],
    },
    {
      name: "【新品】Tシャツ(ブラック)",
      user_id: 3,
      description: description12,
      picture: open("#{Rails.root}/public/images/item12.jpg"),
      keywords_attributes: [
                             { name: "Varter" },
                             { name: "Tシャツ" },
                             { name: "ブラック" },
                             { name: "半袖" },
                             { name: "ロゴ" },
                             { name: "シンプル" },
                             { name: "" },
                             { name: "" },
                             { name: "" },
                             { name: "" }
                           ],
    },
    {
      name: "【中古】コーヒーカップ",
      user_id: 1,
      description: description3,
      picture: open("#{Rails.root}/public/images/item3.jpg"),
      keywords_attributes: [
                             { name: "コーヒー" },
                             { name: "カップ" },
                             { name: "モーニング" },
                             { name: "レンジ対応" },
                             { name: "シンプル" },
                             { name: "紺色" },
                             { name: "" },
                             { name: "" },
                             { name: "" },
                             { name: "" }
                           ],
    },
    {
      name: "【手作り】ガーデニングオーナメント",
      user_id: 2,
      description: description8,
      picture: open("#{Rails.root}/public/images/item8.jpg"),
      keywords_attributes: [
                             { name: "紙粘土" },
                             { name: "犬" },
                             { name: "ガーデニング" },
                             { name: "手作り" },
                             { name: "かわいい" },
                             { name: "オーナメント" },
                             { name: "" },
                             { name: "" },
                             { name: "" },
                             { name: "" }
                           ],
    },
    {
      name: "【新品】トートバッグ",
      user_id: 3,
      description: description13,
      picture: open("#{Rails.root}/public/images/item13.jpg"),
      keywords_attributes: [
                             { name: "Varter" },
                             { name: "バッグ" },
                             { name: "ベージュ" },
                             { name: "コットン" },
                             { name: "ロゴ" },
                             { name: "書類" },
                             { name: "" },
                             { name: "" },
                             { name: "" },
                             { name: "" }
                           ],
    },
    {
      name: "【未使用】ヘアグリース",
      user_id: 1,
      description: description4,
      picture: open("#{Rails.root}/public/images/item4.jpg"),
      keywords_attributes: [
                             { name: "グリース" },
                             { name: "ヘアセット" },
                             { name: "PRISONER" },
                             { name: "スタイリング" },
                             { name: "髪の毛" },
                             { name: "デート" },
                             { name: "" },
                             { name: "" },
                             { name: "" },
                             { name: "" }
                           ],
    },
    {
      name: "【中古】小トトロ(ストラップ2個セット)",
      user_id: 2,
      description: description9,
      picture: open("#{Rails.root}/public/images/item9.jpg"),
      keywords_attributes: [
                             { name: "トトロ" },
                             { name: "アクセサリー" },
                             { name: "ジブリ" },
                             { name: "手作り" },
                             { name: "かわいい" },
                             { name: "セット" },
                             { name: "" },
                             { name: "" },
                             { name: "" },
                             { name: "" }
                           ],
    },
    {
      name: "【ほぼ新品】プルオーバーパーカー(グレー)",
      user_id: 3,
      description: description14,
      picture: open("#{Rails.root}/public/images/item14.jpg"),
      keywords_attributes: [
                             { name: "Varter" },
                             { name: "パーカー" },
                             { name: "グレー" },
                             { name: "シンプル" },
                             { name: "ロゴ" },
                             { name: "プルオーバー" },
                             { name: "" },
                             { name: "" },
                             { name: "" },
                             { name: "" }
                           ],
    },
    {
      name: "【中古】メガネケース(紺色)",
      user_id: 1,
      description: description5,
      picture: open("#{Rails.root}/public/images/item5.jpg"),
      keywords_attributes: [
                             { name: "メガネ" },
                             { name: "ケース" },
                             { name: "紺色" },
                             { name: "留め具" },
                             { name: "牛革" },
                             { name: "視力" },
                             { name: "" },
                             { name: "" },
                             { name: "" },
                             { name: "" }
                           ],
    },
    {
      name: "【未使用】カード10枚セット",
      user_id: 2,
      description: description10,
      picture: open("#{Rails.root}/public/images/item10.jpg"),
      keywords_attributes: [
                             { name: "カード" },
                             { name: "セット" },
                             { name: "ネパール" },
                             { name: "ハンドメイド" },
                             { name: "かわいい" },
                             { name: "海外" },
                             { name: "" },
                             { name: "" },
                             { name: "" },
                             { name: "" }
                           ],
    },
    {
      name: "【中古】キッズTシャツ(ホワイト)",
      user_id: 3,
      description: description15,
      picture: open("#{Rails.root}/public/images/item15.jpg"),
      keywords_attributes: [
                             { name: "Varter" },
                             { name: "Tシャツ" },
                             { name: "キッズ" },
                             { name: "男女兼用" },
                             { name: "文字" },
                             { name: "綿" },
                             { name: "" },
                             { name: "" },
                             { name: "" },
                             { name: "" }
                           ],
    }
  ]
)

item3 = Item.find(3)
item6 = Item.find(6)
item12 = Item.find(12)
item13 = Item.find(13)
item14 = Item.find(14)
item15 = Item.find(15)

# お気に入り登録
user3.favorite(item13)
user3.favorite(item14)
user1.favorite(item15)
user2.favorite(item12)

# コメント
item15.comments.create(user_id: user1.id, content: "可愛いですね♪")
item12.comments.create(user_id: user2.id, content: "素敵ですね♪")

# 通知
user3.notifications.create(user_id: user3.id, item_id: item15.id,
                           from_user_id: user1.id, variety: 1)
user3.notifications.create(user_id: user3.id, item_id: item15.id,
                           from_user_id: user1.id, variety: 2, content: "可愛いですね♪")
user3.notifications.create(user_id: user3.id, item_id: item12.id,
                           from_user_id: user2.id, variety: 1)
user3.notifications.create(user_id: user3.id, item_id: item12.id,
                           from_user_id: user2.id, variety: 2, content: "素敵ですね♪")