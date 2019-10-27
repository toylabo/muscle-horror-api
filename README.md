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
  "name": "チームおもちゃLABO",
  "difficulty": "easy", 
  "score": 114514,
  "analysis": {
    "muscleCount": 67,
    "remainingClearSecond": 30,
    "GetKeySecond": 150,
  },
  "life": 3
}
```
difficulty: easy, normal, hardの3種類

- Response

`非認証時: 401 UnAuthorized`

```json
{
  "responseCode": 200,
  "message": "Success!",
  "url": "https://〇〇.✕✕.com/aaa",
  "qr": "https://chart.apis.google.com/chart?cht=qr&chs=300x300&choe=utf8&chl=https://〇〇.✕✕.com/aaa"
}
```

### [GET] /results/{resultId} 結果の取得

- HTTP Request Headers

```
token: トークン
```

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

### [DELETE] /results/{resultId} 結果の削除

- HTTP Request Headers

```
token: トークン
```

- Parameters

```
resultId: 返してほしい結果のID
```

- Response

```
成功時: 204 No Content
非認証時: 401 UnAuthorized
指定したidがないとき: 404 Not Found
id未指定時: 400 Bad Request
```

### [GET] /results リセントの取得

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
      "id": 2,
      "name": "チーム2",
      "score": 810000
    },
    {
      "id": 1,
      "name": "チーム1",
      "score": 114514
    }
  ]
}
```


### [GET] /ranking ランキングの取得

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
      "id": 2,
      "name": "チーム2",
      "score": 810000
    },
    {
      "id": 1,
      "name": "チーム1",
      "score": 114514
    }
  ]
}
```
