# Custom GPT "Etsy SEO POD" — hướng dẫn tạo

Bản chuyển đổi skill `etsy-seo` (Claude) sang ChatGPT Custom GPT. Cần ChatGPT Plus/Team trở lên.

## Các bước (~5 phút)

1. ChatGPT → **Explore GPTs** → **+ Create** → tab **Configure**.
2. **Name:** `Etsy SEO POD`
3. **Description:** `Viết Title + 13 Tags + Description chuẩn SEO Etsy cho design POD — long-tail 5-6 từ, lọc tag 4 lớp, đếm ký tự bằng code.`
4. **Instructions:** mở `1_INSTRUCTIONS.txt` → copy toàn bộ → dán vào (7.735/8.000 ký tự).
5. **Conversation starters:**
   - `Viết SEO Etsy cho design này (gửi kèm ảnh)`
   - `Viết SEO cho sweatshirt, niche: ...`
   - `Chỉ cần 13 tags cho design này`
   - `Đây là tag topbubbleindex mình vừa copy, lọc giúp`
6. **Knowledge:** upload cả 3 file trong thư mục `knowledge/` (giữ nguyên tên file, vì Instructions gọi theo tên):
   - `etsy-seo-pipeline.md`: quy trình đầy đủ 4 bước
   - `etsy-seo-rules.md`: hard rules Title/Tags/Description
   - `seo-report-template.md`: format report
7. **Capabilities:** bật ✅ **Web Search**, ✅ **Code Interpreter & Data Analysis** (để đếm ký tự và xuất file .md). Tắt Image Generation và Canvas.
   **MCP:** bật 2 MCP connector **ytrends** + **EverBee** bạn đã add (Settings → Apps & Connectors, Developer mode) cho GPT nếu builder có mục chọn connector.
8. **Create** → chọn **Only me** hoặc **Anyone with the link** / workspace nếu muốn chia sẻ cho team.

## ⚠️ Kiểm tra connector trước khi dùng thật

Instructions mặc định gọi MCP **ytrends + EverBee**. MCP connector tự add (Developer mode) chạy được ở chat thường nhưng **chưa chắc gọi được trong Custom GPT** (tuỳ gói và phiên bản ChatGPT). Test 1 lần:

1. Mở GPT vừa tạo → gửi 1 ảnh design.
2. Xem GPT có hiện bước gọi tool `ytrends_research_keyword` / EverBee không, và bảng keyword có số thật (không phải "no data") không.

**Nếu GPT không gọi được MCP** → dùng **ChatGPT Project** thay cho Custom GPT (cùng nội dung):
- Tạo Project "Etsy SEO POD" → **Project instructions**: dán `1_INSTRUCTIONS.txt`.
- **Project files**: upload 3 file trong `knowledge/`.
- Chat trong Project → bật Developer mode + chọn MCP ytrends và EverBee ở nút **+** / Tools của ô chat.
- Cách dự phòng cuối: chat thường bật 2 MCP, upload 3 file knowledge và dán Instructions vào tin nhắn đầu.

## Khác bản Claude ở đâu

| Bước | Claude (skill gốc) | ChatGPT (bản này) |
|---|---|---|
| 2: Keyword | Gọi `mcp__trends-ytuong` | Gọi MCP **ytrends** (trend, hidden gem) + **EverBee** (volume, competition); lỗi thì fallback eRank dán vào / Web Search |
| 2B: Support tags | Tự mở Chrome lấy tag topbubbleindex | Tag top listing từ MCP **EverBee** → lọc 4 lớp; topbubbleindex thành tuỳ chọn verify (bạn tự copy dán) |
| 4: Lưu report | Tự lưu `~/Etsy-SEO/reports/` | In trong chat; muốn file thì nói "xuất file" → tải .md về |
| Đếm ký tự | Claude tự đếm | Bắt buộc đếm bằng Python (Code Interpreter) |

**Mẹo:** gửi ảnh design + product type ngay tin nhắn đầu là đủ, GPT tự gọi MCP ytrends + EverBee. Muốn chắc hơn thì dán thêm tag topbubbleindex khi GPT đưa link.

**Khi sửa skill gốc:** cập nhật lại `knowledge/` (upload đè) và `1_INSTRUCTIONS.txt` để 2 bản luôn đồng bộ.
