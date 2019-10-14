# 筋肉ホラー祭りAPI

## 概要
筋肉ホラー祭りのAPI

## Ruby version
2.6.5

## Rails version
2.6.0

## APIリファレンス

### [POST] /login トークン取得
- Parameters

```json
{
  "name": "admin",
  "password": "password"
}
```

- Responce
```json
{
  "responceCode": 200,
  "token": "uD76GY58HGyg6IDls"
}
```

### [POST] /results 結果の追加

- Parameters

```json
{
  "responseCode": 200,
  "message": "Success!",
  "name": "チームおもちゃLABO",
  "difficulty": "easy", 
  "score": 114514,
  "analysis": {
    "muscleMenu": 3,
    "muscleSpeed": 120,
    "clearTime": 240,
    "remainingTime": 60,
    "key": 2
  },
  "life": 3
}
```
difficulty: easy, normal, hardの3種類

- Response

```json
{
  "responseCode": 200,
  "message": "Success!",
  "url": "https://〇〇.✕✕.com/aaa",
  "qr": "https://chart.apis.google.com/chart?cht=qr&chs=300x300&choe=utf8&chl=https://〇〇.✕✕.com/aaa"
}
```

### [GET] /results/{resultId} 結果の取得

- Parameters

```
resultId: 返してほしい結果のID
```

- Response

```json
{
  "responseCode": 200,
  "message": "Success!",
  "result": {
    "name": "チームおもちゃLABO",
    "difficulty": "easy",
    "score": 114514,
    "analysis": {
      "muscle": 4,
      "speed": 3,
      "affinity": 5,
      "exploratory": 2
    },
    "life": 1
  }
}
```

### [GET] /results ランキングの取得

- Parameters

```
order: desc or asc (default: desc)
page: ページ番号
per_page: 1ページあたりの件数 (default: 5)
```

- Response

```json
{
  "responseCode": 200,
  "message":"Success!",
  "total": 813,
  "currentPage": 1,
  "results": [
    {
      "id": 1,
      "name": "チーム1",
      "score": 114514
    },
    {
      "id": 2,
      "name": "チーム2",
      "score": 810000
    }
  ]
}
```
