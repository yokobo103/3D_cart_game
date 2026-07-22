# 生成コース統合の復元手順

統合前の状態はGitブランチ `backup/pre-generated-courses-20260723` に固定している。
統合作業は `feature/generated-course-integration-20260723` で行う。

## 統合前へ戻す

作業中の変更を残す必要がなければ、次のバックアップブランチへ切り替える。

```powershell
git switch backup/pre-generated-courses-20260723
```

統合版へ戻る場合:

```powershell
git switch feature/generated-course-integration-20260723
```

## GLBだけ無圧縮原本へ戻す

無圧縮原本は次に保存されている。

`../20260707_サーキット生成パイプライン/dist/kart_*.glb`

原本のSHA-256は `courses/MESHOPT_ORIGINALS.md` を参照する。

## 統合元

`../20260708_よこぼカート_生成コース連携/`

既存リポジトリ固有の `reference/`、`.gitignore`、`preview-server.cjs` は統合時に保持している。
