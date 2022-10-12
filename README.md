# Windows Tools

## Powershellの権限設定

管理者権限で下記のコマンドを実行する。

```ps1
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
```

## アプリのインストール(chocolate package manager)

> 参照：<https://github.com/gekal/choco-package-config>

1. `.\choco\setup.cmd` を実行する。

## Eclipse Temurin™

[Eclipse Temurin™](https://adoptium.net/temurin/releases/)をダウンロードしてインストールする。

## Maven

1. `.\maven\setup.ps1` を実行して、環境を準備する。
2. Pathに `%MAVEN_HOME%\bin` を追加してください。

## Gradle

1. `.\gradle\setup.ps1` を実行して、環境を準備する。
2. Pathに `%GRADLE_HOME%\bin` を追加してください。
