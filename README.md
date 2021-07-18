# Windows Tools

## Powershellの権限設定

管理者権限で下記のコマンドを実行する。

```ps1
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
```

## Maven

1. `.\maven\setup.ps1` を実行して、環境を準備する。
2. Pathに `%MAVEN_HOME%\bin` を追加してください。
