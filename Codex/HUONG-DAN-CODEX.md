# Cài skill `etsy-seo` cho Codex trên máy bất kỳ (Mac / Windows)

Gói này gồm:

```
Etsy-SEO-Codex/
├── etsy-seo/                  ← skill (SKILL.md, RULES.md, templates/, agents/openai.yaml)
├── install-codex.sh           ← cài trên Mac / Linux
├── install-codex.bat          ← cài trên Windows (bấm đúp)
├── install-codex.ps1          ← script Windows mà file .bat gọi
└── HUONG-DAN-CODEX.md         ← file này
```

Script cài sẽ làm 3 việc:
- Copy skill vào `~/.agents/skills/etsy-seo`. Nếu đã có bản cũ thì chuyển sang `~/.agents/skills-backup/`, không xoá. Bản sao lưu nằm ngoài thư mục skills để Codex không thấy 2 skill trùng tên.
- Tạo thư mục `~/Etsy-SEO/reports` để lưu report.
- Hỏi URL MCP ytrends và EverBee rồi thêm vào `~/.codex/config.toml`. Trước khi sửa, script sao lưu file cấu hình. Nếu đã có server cùng tên thì giữ nguyên, không ghi đè.

---

## Bước 0 — Chuẩn bị trên máy mới

1. **Cài Codex**, chọn 1 trong 2 cách:
   - App **ChatGPT desktop**, rồi mở Codex trong app. Đăng nhập cùng tài khoản ChatGPT.
   - Hoặc **Codex CLI**: cài Node.js, rồi chạy `npm install -g @openai/codex`, rồi `codex` và đăng nhập.
2. Mở Codex **1 lần** để nó tạo thư mục `~/.codex`.
3. Lấy sẵn 2 URL MCP: ChatGPT → Settings → Apps & Connectors → mở **ytrends** rồi tới **EverBee** → copy **MCP Server URL**.
   Connector đã gắn với tài khoản ChatGPT thì máy nào cũng thấy, nhưng Codex vẫn phải khai báo riêng.

## Bước 1 — Copy gói sang máy mới

Copy file `Etsy-SEO-Codex.zip` qua máy mới (Google Drive, USB, Zalo…), rồi **giải nén**.

## Bước 2 — Chạy script cài

**Mac:** mở Terminal, gõ `bash ` (có dấu cách), kéo file `install-codex.sh` vào cửa sổ Terminal rồi Enter. Hoặc chạy:

```bash
cd ~/Downloads/Etsy-SEO-Codex && bash install-codex.sh
```

**Windows:** bấm đúp `install-codex.bat`. Nếu Windows hiện cảnh báo SmartScreen thì chọn **More info → Run anyway**.

Khi script hỏi, dán URL MCP ytrends và EverBee rồi Enter. Chưa có URL thì cứ Enter để bỏ qua, chạy lại script sau cũng được.

## Bước 3 — Khởi động lại Codex và test

1. Thoát hẳn Codex rồi mở lại.
2. Gõ `/skills` → phải thấy **etsy-seo (Etsy SEO POD)**.
3. Gõ `/mcp` → phải thấy `ytrends` và `everbee`. Lần đầu Codex có thể mở cửa sổ đăng nhập OAuth, bạn tự đăng nhập.
4. Kéo 1 ảnh design vào rồi gõ:

```
$etsy-seo viết SEO Etsy cho design này, product type: t-shirt
```

**Đạt khi:** Codex gọi `ytrends_research_keyword` và EverBee, bảng keyword có số thật, title ≤140 ký tự, đủ 13 tag mỗi tag ≤20 ký tự, và có file report trong `~/Etsy-SEO/reports/` (Windows: `C:\Users\<tên>\Etsy-SEO\reports\`).

---

## Cài tay (không dùng script)

| | Mac | Windows |
|---|---|---|
| Thư mục skill | `~/.agents/skills/etsy-seo/` | `C:\Users\<tên>\.agents\skills\etsy-seo\` |
| File cấu hình | `~/.codex/config.toml` | `C:\Users\<tên>\.codex\config.toml` |

Copy nguyên thư mục `etsy-seo/` vào thư mục skill, rồi thêm vào cuối `config.toml`:

```toml
[mcp_servers.ytrends]
url = "<URL MCP ytrends>"

[mcp_servers.everbee]
url = "<URL MCP EverBee>"
```

Nếu MCP dùng API key thay vì đăng nhập: thêm dòng `bearer_token_env_var = "EVERBEE_API_KEY"` dưới `url` và đặt biến môi trường đó. **Không dán key trực tiếp vào file.**

## Giao cho Codex tự cài

Giải nén gói, mở Codex **trong thư mục vừa giải nén**, rồi dán đoạn này (thay 2 URL):

```
Cài skill etsy-seo cho Codex từ thư mục hiện tại:
1. Copy thư mục ./etsy-seo vào ~/.agents/skills/etsy-seo (Windows: %USERPROFILE%\.agents\skills\etsy-seo). Nếu đã có thì chuyển bản cũ sang ~/.agents/skills-backup/ (KHÔNG để trong thư mục skills), không xoá.
2. Tạo thư mục ~/Etsy-SEO/reports.
3. Sao lưu ~/.codex/config.toml, giữ nguyên mọi cấu hình hiện có, thêm vào cuối:
   [mcp_servers.ytrends] url = "<URL MCP ytrends>"
   [mcp_servers.everbee] url = "<URL MCP EverBee>"
   Nếu đã có server cùng tên thì báo tôi, không ghi đè.
4. Liệt kê lại kết quả để tôi kiểm tra, rồi nhắc tôi khởi động lại Codex.
```

## Lưu ý

- Cài nhiều máy: mỗi máy chạy script 1 lần. Muốn cập nhật skill thì thay thư mục `etsy-seo/` trong gói rồi chạy lại script, bản cũ được giữ trong `~/.agents/skills-backup/`.
- Report nằm trên máy nào thì chỉ có ở máy đó. Muốn dùng chung giữa các máy thì đặt `~/Etsy-SEO/` trong Google Drive hoặc Dropbox.
- URL MCP ytrends đúng là `https://mcp.trends.ytuong.ai/mcp` (Streamable HTTP). Link cũ `.../sse` đã ngừng (lỗi 410), đừng dùng.
