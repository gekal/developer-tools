# Apache Server

## コンフィグの修正

最低限には、下記のコンフィグを修正する必要があります。

> Path: `.\Apache24\conf\httpd.conf`

```diff
- Define SRVROOT "/Apache24"
+ Define SRVROOT "C:\\tools\\Apache\\Apache24"
```

## コマンド修正

### サーバーのフォアグラウンド起動

```powershell
C:\tools\Apache\Apache24\bin\httpd.exe
```

### サービスとしての起動

> `管理者権限`が必要のため、ご注意ください。

1. 登録

    ```powershell
    C:\tools\Apache\Apache24\bin\httpd.exe -k install
    ```

2. 削除

    ```powershell
    C:\tools\Apache\Apache24\bin\httpd.exe -k uninstall
    ```

3. 起動

    ```powershell
    C:\tools\Apache\Apache24\bin\httpd.exe -k start
    ```

4. 停止

    ```powershell
    C:\tools\Apache\Apache24\bin\httpd.exe -k stop
    ```

5. 再起動

    ```powershell
    C:\tools\Apache\Apache24\bin\httpd.exe -k restart
    ```
