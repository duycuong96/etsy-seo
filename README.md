# Etsy SEO Skill — Viết Title + 13 Tags + Description chuẩn SEO Etsy

Công cụ giúp seller POD viết **listing Etsy chuẩn SEO** (Title 140 ký tự, 13 tags, description tối ưu) chỉ bằng cách **kéo thả ảnh design** vào Claude. Tự động nghiên cứu keyword bằng dữ liệu thật rồi xuất nội dung copy-paste thẳng lên Etsy.

---

## 🚀 Cài đặt (Windows) — 3 bước

### Bước 1 — Tải về từ Git
Cách A (có sẵn Git): mở **Command Prompt** / **PowerShell**, chạy:
```
git clone https://github.com/duycuong96/etsy-seo.git
cd etsy-seo
```

Cách B (không có Git): vào https://github.com/duycuong96/etsy-seo → nút **Code** → **Download ZIP** → giải nén ra một thư mục.

### Bước 2 — Chạy trình cài tự động
**Double-click file `install.bat`** trong thư mục vừa tải.

Script sẽ tự động:
- ✅ Kiểm tra & cài **Node.js** (nếu thiếu)
- ✅ Cài **Claude Code** (CLI chạy skill)
- ✅ Cài **skill etsy-seo** vào máy
- ✅ Kết nối **công cụ nghiên cứu keyword** (MCP trends-ytuong)
- ✅ Tạo thư mục lưu kết quả: `C:\Users\<tên-bạn>\Etsy-SEO\reports`

> Nếu lần đầu máy chưa có Node.js, script sẽ cài Node rồi báo bạn **đóng cửa sổ, mở lại và chạy `install.bat` thêm 1 lần nữa**. Đây là bước bình thường.

### Bước 3 — Đăng nhập & dùng
1. Mở **một cửa sổ terminal mới**, gõ: `claude`
2. Lần đầu sẽ yêu cầu **đăng nhập tài khoản Claude** — làm theo hướng dẫn trên màn hình.
3. Khi đã vào, gõ `/etsy-seo` rồi **kéo thả ảnh design** vào. Xong!

---

## 🍎 Cài đặt (macOS / Linux)
```
git clone https://github.com/duycuong96/etsy-seo.git
cd etsy-seo
bash install.sh
```

---

## 💡 Cách dùng hàng ngày

Trong cửa sổ `claude`:
- Gõ `/etsy-seo` rồi **kéo thả ảnh design** vào, HOẶC
- Nói tự nhiên: *"viết SEO Etsy cho design này"* + gửi ảnh.

Skill sẽ chạy **pipeline 4 bước** và trả về sẵn để copy lên Etsy:

1. **Phân tích design** — chủ thể, niche, persona, dịp, insider keywords.
2. **Nghiên cứu keyword** — dùng tool dữ liệu thật (trends-ytuong; thêm EverBee nếu bạn có), xuất bảng 15–20 keyword (volume + competition).
3. **Viết listing:**
   - **Title** ≤140 ký tự, frontload keyword chính vào 40 ký tự đầu.
   - **13 Tags**, mỗi tag ≤20 ký tự (3 broad + 5 niche + 3 long-tail + 2 seasonal).
   - **Description** 5 block (hook / features / gift / care / CTA), 160 ký tự đầu chuẩn meta.
4. **Lưu file + in block dễ copy** (Title / 13 tags 1 dòng / hook) ra chat.

Kết quả lưu tại: `C:\Users\<tên-bạn>\Etsy-SEO\reports\` (Mac: `~/Etsy-SEO/reports/`).

---

## 🐝 (Tuỳ chọn) Bật EverBee để có số liệu sâu hơn

Không có EverBee skill **vẫn chạy đủ** bằng trends-ytuong + topbubbleindex. Nếu có tài khoản EverBee, bật thêm để có volume/tháng chính xác, số listing cạnh tranh, doanh số ước tính và tag của listing bán chạy:

1. Vào **claude.ai → Settings → Connectors** → thêm **EverBee** → đăng nhập tài khoản EverBee.
2. Mở lại `claude`. Skill tự nhận EverBee và chạy thêm Bước 2A; không cần cấu hình gì khác.

---

## 📋 Bảng SEO Etsy nhanh (xem chi tiết trong `RULES.md`)

| Field | Hard limit | Best practice |
|-------|-----------|---------------|
| Title | 140 ký tự | Frontload 40 ký tự đầu, phân tách bằng `,`, không nhồi keyword |
| Tags | 13 tags × 20 ký tự | Long-tail > từ đơn, không trùng từ y hệt |
| Description (đầu) | 160 ký tự = meta | Primary keyword + emotional hook + product type |
| Description (total) | 300–500 từ | 5 block: hook / features / gift / care / CTA |

---

## 📂 Cấu trúc thư mục

```
etsy-seo/                       ← repo tải từ Git
├── install.bat                 ← Windows: double-click để cài
├── install.ps1                 ← script cài Windows (PowerShell)
├── install.sh                  ← macOS / Linux: bash install.sh
├── SKILL.md                    ← định nghĩa skill (pipeline 4 bước)
├── RULES.md                    ← quy tắc viết Title/Tags/Description đầy đủ
├── README.md                   ← file này
└── templates/
    └── seo_report_template.md  ← template report
```

---

## ❓ Gặp lỗi thường gặp

| Triệu chứng | Cách xử lý |
|-------------|-----------|
| `'claude' is not recognized` | Đóng terminal, **mở cửa sổ mới** rồi gõ lại `claude`. |
| Script báo cài Node.js xong | **Đóng – mở lại** terminal, chạy `install.bat` thêm 1 lần. |
| Cài Claude Code lỗi quyền | Mở PowerShell bằng **Run as Administrator** rồi chạy lại. |
| `/etsy-seo` không hiện | Kiểm tra skill đã copy vào `%USERPROFILE%\.claude\skills\etsy-seo`; chạy lại `install.bat`. |
| Keyword research không có data | Trong `claude` gõ: `claude mcp add --scope user --transport sse trends-ytuong https://mcp.trends.ytuong.ai/sse` |
