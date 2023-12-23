# Ruby on Rails 簡易 API 練習 

## 簡介

第一次寫 Ruby on Rails 先用簡易的API 來了解這個框架如何使用

## 安裝

使用以下步驟安裝：

1. Clone 這個存儲庫：`git clone https://github.com/liao-chien-chun/Ruby-on-Rails_Message_Board.git`
2. 進入項目文件夾：`cd your-project-path`
3. 安裝依賴：`bundle install`

## 使用

啟動伺服器

```bash
$ rails server
```

### 目前功能介紹
使用者註冊 POST /api/register

取得所有留言 GET /api/messages
  
新增留言 POST /api/messages  
  
取得單一留言 GET /api/messages/:id
  
更新留言 PATCH /api/messages/:id
  
刪除留言 DELETE /api/messages/:id