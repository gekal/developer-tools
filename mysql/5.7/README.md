# MySql8系使用メモ

## コンフィグ

```ini
[mysqld]
basedir=C:\\tools\\mysql\\5.7\\mysql-5.7.41-winx64\\
datadir=C:\\tools\\mysql\\5.7\\mysql-5.7.41-winx64\\data

[client]
port=3306

[mysqld]
port=3306
```

## コマンド

> `5.7.41` 前提のコマンド

1. データベースの初期化

    ```powershell
    # --initialize-insecure オプションは本番向けではありません。
    C:\tools\mysql\5.7\mysql-5.7.41-winx64\bin\mysqld --initialize-insecure --user=mysql
    ```

2. プロセスの起動

    ```powershell
    C:\tools\mysql\5.7\mysql-5.7.41-winx64\bin\mysqld.exe --console
    ```

3. コマンドプロンプトの接続

    ```powershell
    # パスワードなしでログインします。
    C:\tools\mysql\5.7\mysql-5.7.41-winx64\bin\mysql -u root --skip-password
    ```

## Windowsサービス関連

1. 登録

    ```powershell
    C:\tools\mysql\5.7\mysql-5.7.41-winx64\bin\mysqld.exe --install MySQL
    ```

2. 削除

    ```powershell
    # cmd: SC DELETE MySQL
    C:\tools\mysql\5.7\mysql-5.7.41-winx64\bin\mysqld.exe --remove
    ```

3. 開始

    ```powershell
    # cmd: SC start MySQL
    Start-Service -Name "MySQL"
    ```

4. 停止

    ```powershell
    # cmd: SC stop MySQL
    Stop-Service -Name "MySQL"
    ```

5. 再起動

    ```powershell
    Restart-Service -Name "MySQL"
    ```

5. ステータス

    ```powershell
    Get-Service -Name "MySQL"
    ```

## 参照

1. [Windows10にzipのMySQLをインストールして起動する方法](https://qiita.com/KOJI-YAMAMOTO/items/02af20e7b5cd27932a27)
