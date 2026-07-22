# 生成コースGLBの復元情報

ゲーム内の `kart_*.glb` はMeshopt high圧縮版。無圧縮の原本は次に保存されている。

`../../20260707_サーキット生成パイプライン/dist/`

| ファイル | 原本SHA-256 |
|---|---|
| kart_meadow.glb | `D4A4475B9DB4D17701CD5151FE87A9C95B671D343F14A66B994198A7D7F050F3` |
| kart_canyon.glb | `223B1F3028D300FDC6413ED2E517A6D08F9D2E18F5B10AAE9D93D9A6DB059B2A` |
| kart_city.glb | `7BA6DA2E954F554EEF89720B3A79EA5A59F14DB6874FB8E8A0FE22F2E5313A76` |

復元時は原本をこのディレクトリへ同名コピーし、`index.html` の
`MeshoptDecoder` importと `setMeshoptDecoder()` は残しても問題ない。
