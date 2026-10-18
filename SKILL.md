---
name: etsy-seo
description: Pipeline 4 bước viết Title + 13 Tags + Description chuẩn SEO Etsy cho design POD. Bước 1 nghiên cứu design (insight ngắn cho SEO), Bước 2 keyword research bằng mcp__trends-ytuong + chốt LONG-TAIL CHÍNH 5-6 từ (quan trọng nhất) rồi search long-tail trên topbubbleindex Etsy Tag Generator để lọc tag hỗ trợ, Bước 3 viết Title/Tags/Description theo Etsy 2026 best practices, Bước 4 lưu file `~/Etsy-SEO/reports/`. Trigger: "/etsy-seo", "viết SEO Etsy", "title tag description Etsy", hoặc khi user gửi ảnh design / report analyze-design + nhờ viết SEO listing.
metadata:
  type: skill
  scope: project
---

# Etsy SEO — Pipeline 4 bước

Skill viết **Title + 13 Tags + Description** chuẩn SEO Etsy cho design POD (t-shirt, hoodie, sticker, poster, mug, tote). Pipeline yêu cầu **nghiên cứu design trước**, sau đó **research keyword bằng tool data thật**, mới viết SEO.

> ⚠️ **Đầu vào bắt buộc:** Một trong hai:
> - **Ảnh design** (jpg/png/webp) — kéo thả vào chat, HOẶC
> - **File report `.md` từ skill `[[analyze-design]]`** (nếu có cài) — paste đường dẫn file.
>
> Nếu user chưa gửi → hỏi: *"Bạn gửi ảnh design (kéo thả vào đây) hoặc đường dẫn file report analyze-design giúp mình. Không bịa nội dung khi chưa có design thật."*
>
> 📁 **Đường dẫn portable (chạy được trên mọi máy Windows/Mac):**
> - Report lưu tại: `~/Etsy-SEO/reports/` (Windows: `C:\Users\<tên-bạn>\Etsy-SEO\reports\`)
> - Template + RULES nằm cùng skill: `~/.claude/skills/etsy-seo/`
> - `~` = thư mục home của user; Read/Write tự resolve trên cả Windows lẫn Mac.

---

## Khi nào dùng

- User gõ `/etsy-seo` hoặc nói "viết SEO Etsy", "title tag description Etsy", "viết listing Etsy".
- User vừa chạy xong `/analyze-design` và muốn chuyển sang phần SEO listing.
- User gửi ảnh design + nhờ tối ưu listing Etsy.

## Khi nào KHÔNG dùng

- User cần phân tích design chi tiết (style, ideation, validate) → dùng `[[analyze-design]]`.
- User cần research niche tổng thể (chưa có design) → dùng skill research niche khác.
- User cần SEO cho platform khác (Amazon Merch, Shopify, Redbubble) — skill này tối ưu cho **Etsy** (algorithm Etsy 2025-2026, 140 char title, 13 tags 20 char, description hook 160 char đầu).

---

## Đầu vào — Hỏi user nếu chưa rõ

1. **Design source** (bắt buộc): Ảnh PNG/JPG, HOẶC path file `.md` analyze-design report.
2. **Product type chính** (optional): tee / hoodie / sticker / poster / mug / tote. Mặc định: t-shirt nếu không nói khác.
3. **Niche / persona đã biết trước** (optional): nếu user xác nhận trước thì keyword research focus hơn. Mặc định: tự suy luận từ design.
4. **Có chạy keyword research với `mcp__trends-ytuong` không?** Mặc định **CÓ**. Nếu user nói "skip keyword tool" → dùng best judgement và ghi rõ caveat trong report.
5. **Có search long-tail trên topbubbleindex không?** Mặc định **CÓ** (Bước 2B, cần Chrome extension Claude in Chrome đã kết nối). Nếu không có Chrome → dùng fallback trong Bước 2B.
6. **Lưu report ra file?** Mặc định **CÓ**, lưu vào `~/Etsy-SEO/reports/YYYY-MM-DD_<design-slug>.md` (Windows: `C:\Users\<tên>\Etsy-SEO\reports\`). Nếu "chỉ inline" → trả thẳng chat, không tạo file.

---

## Pipeline 4 bước (THỰC THI THEO THỨ TỰ)

### Bước 1 — Design Insight Snapshot (tóm tắt cho SEO)

Mục tiêu: trích ra **đủ thông tin để chọn đúng keyword**, KHÔNG cần đủ 11 khía cạnh style như `[[analyze-design]]`.

**Trường hợp A — Input là file report từ `[[analyze-design]]`:**
- Đọc file `.md` bằng tool Read.
- Trích các section: `Cultural Context`, `Design Insight (4W + Meaning + Why it sells)`, `Marketing Report` (nếu có).
- Tóm tắt thành 7 trường ở dạng bảng — KHÔNG phân tích lại từ đầu.

**Trường hợp B — Input là ảnh design:**
- Xem ảnh thật bằng Read tool.
- Trả lời **7 trường** sau (không nhiều hơn — đây là "snapshot for SEO", không phải full analysis):

| Trường | Yêu cầu trả lời |
|--------|-----------------|
| **Subject** | Chủ thể chính 1 câu (vd: "cowgirl mama ôm bouquet wildflower, sunset Texas background") |
| **Theme / Niche văn hoá** | Western Americana / Cottagecore / Y2K / Dark Academia / Boho / Religious Christian / Halloween Goth / Christmas trad / Outdoor / Vintage Americana / Kawaii / Hip-hop streetwear / ... |
| **Target persona** | Buyer + Gifter chi tiết (vd: "Cowgirl mom 30-45, rural Texas/Oklahoma; gifter là con/chồng mua tặng Mother's Day") |
| **Occasion / dịp** | Year-round / Mother's Day / Father's Day / Halloween / Christmas / Valentine / Back-to-school / Birthday / Anniversary / Wedding / Graduation |
| **Emotional hook** | 1 câu — vì sao buyer muốn mua (identity / cảm xúc / belonging / inside joke / tribute / faith) |
| **Insider keywords** | 5-10 từ/cụm cộng đồng dùng (vd Western: cowgirl, rodeo, longhorn, wildflower, sunset, boots, ranch, mama, country) |
| **Product fit** | Sản phẩm hợp nhất (tee / hoodie / sticker / poster / mug / tote) + lý do 1 câu |

> ⚠️ **Quy tắc:** Không sang Bước 2 nếu Bước 1 chưa đủ 7 trường. Insider keywords ở Bước 1 là **input quan trọng nhất** cho Bước 2.

---

### Bước 2 — Keyword Research với `mcp__trends-ytuong`

> ⚙️ Mặc định **BẮT BUỘC** dùng tool data thật. Nếu user yêu cầu skip → bỏ qua Bước 2, ghi caveat trong report: *"⚠️ Skipped keyword research — title/tags dựa trên best judgement, recommend cross-check bằng eRank/Marmalead trước khi launch."*

**2.1 — Gọi tool theo thứ tự:**

1. **`ytrends_research_keyword`** — input là 2-3 keyword cốt lõi rút từ Bước 1 (vd: "cowgirl mom shirt", "western mama tee"). Lấy: search volume, competition score, related keywords.

2. **`ytrends_find_trending_keywords`** — niche từ Bước 1 (vd: "western", "boho mom"). Lấy keyword đang trend tháng này (2026-05 trở đi).

3. **`ytrends_explore_niche`** — explore cluster keyword cùng niche. Lấy long-tail variants.

4. **`ytrends_find_hidden_gems`** — tìm long-tail low-competition cho niche.

5. **`ytrends_get_keyword_rank`** (optional, nếu cần verify) — check 3-5 candidate keyword cuối có thực sự có volume + competition phù hợp không.

**2.2 — Xuất bảng keyword candidates (15-20 keyword):**

| # | Keyword | Search vol | Competition | Loại | Verdict |
|---|---------|-----------|-------------|------|---------|
| 1 | cowgirl mom shirt | high | medium | primary | ✅ Title + Tag |
| 2 | western mama tee | medium | low | primary | ✅ Title + Tag |
| 3 | wildflower country mom | low | very low | long-tail | ✅ Tag |
| 4 | mothers day cowgirl gift | medium | medium | seasonal | ✅ Title + Tag |
| ... | ... | ... | ... | ... | ... |

**2.3 — Phân loại final:**
- **3 primary** (high-medium volume, sẽ vào title đầu)
- **5 niche-specific** (medium volume, đặc trưng persona)
- **3 long-tail** (low volume, low competition — dễ rank)
- **2 seasonal / gift / occasion**
- **+2-3 backup** (dự phòng nếu trùng từ)

> ⚠️ **Không bịa số liệu.** Nếu tool trả về "no data" cho keyword nào → ghi rõ "no data, judgement-based" thay vì làm số đẹp.

**2.4 — Chốt LONG-TAIL CHÍNH (từ khoá quan trọng nhất của listing)**

Long-tail chính là cụm buyer gõ khi **đã biết rõ mình muốn gì** → intent mua cao nhất, ít cạnh tranh hơn broad. Mọi thứ phía sau (title, tag, description) xoay quanh nó.

| Quy tắc | Chi tiết |
|---------|----------|
| **Độ dài** | **5-6 từ là chuẩn đẹp nhất**. 4 từ chấp nhận được nếu không ghép tự nhiên được 5. **KHÔNG quá 6 từ.** |
| **Cấu trúc** | `[Style/Modifier] + [Subject/Niche] + [Persona] + [Product type]` — vd `retro cowgirl mama western shirt` (5), `funny bird watching dad shirt` (5), `vintage pilates girl club sweatshirt` (5) |
| **Phải là cụm buyer thật sự gõ** | Ghép từ keyword có data ở 2.2 + insider keywords Bước 1. Không ghép cụm "nghe hay" nhưng không ai search. |
| **Có product type** | Luôn kết thúc bằng loại sản phẩm (shirt / tee / sweatshirt / hoodie / mug / sticker...) |
| **Độ dài ký tự** | Nên ≤40 chars để nằm trọn vùng frontload của Title |
| **Không TM** | Không chứa brand/nhân vật/slogan có nhãn hiệu |

Chốt:
- **1 Long-tail CHÍNH** (5-6 từ) — đứng đầu Title, nguyên văn.
- **2 Long-tail PHỤ** (4-6 từ) — biến thể theo persona khác / occasion / style khác (vd `cowgirl mom mothers day gift`, `western mama graphic tee`).

**Output 2.4:**

| Loại | Long-tail | Số từ | Chars | Nguồn |
|------|-----------|-------|-------|-------|
| CHÍNH | retro cowgirl mama western shirt | 5 | 32 | ytrends + insider kw |
| Phụ 1 | ... | ... | ... | ... |
| Phụ 2 | ... | ... | ... | ... |

---

### Bước 2B — Search Long-tail trên topbubbleindex → Lọc tag hỗ trợ

> 🎯 Mục tiêu: lấy **tag mà các listing top Etsy đang dùng cho chính long-tail đó**, rồi lọc ra tag **hỗ trợ tốt** cho long-tail chính. Tool: https://www.topbubbleindex.com/etsy/etsy-tag-generator
>
> Số đỏ cạnh mỗi tag = **số listing top đang dùng tag đó** cho từ khoá search (tần suất) → càng cao càng được thị trường xác nhận.

**2B.1 — Search bằng Chrome (Claude in Chrome)**

Site chặn gọi API trực tiếp bằng reCAPTCHA → **bắt buộc dùng trình duyệt thật**. Mở thẳng URL có tham số (KHÔNG cần gõ + bấm Search):

```
https://www.topbubbleindex.com/etsy/etsy-tag-generator?keyword=<long-tail, khoảng trắng = %20>
```

Quy trình (làm cho Long-tail CHÍNH trước, rồi 2 Long-tail PHỤ):
1. `tabs_context_mcp` (createIfEmpty) → `navigate` tới URL trên.
2. `javascript_tool` chạy đoạn trích xuất (đợi kết quả tối đa 20s, gộp tag trùng hoa/thường, cộng dồn tần suất):

```js
for (let i = 0; i < 20 && !document.querySelectorAll('.badgeTagEtsy').length; i++) await new Promise(r => setTimeout(r, 1000));
const m = {};
document.querySelectorAll('.badgeTagEtsy').forEach(b => {
  const t = (b.dataset.k || '').trim().toLowerCase();
  if (t) m[t] = (m[t] || 0) + (+(b.querySelector('.badge')?.innerText) || 0);
});
({ keyword: document.querySelector('.keywordOverview')?.innerText,
   total: Object.keys(m).length,
   tags: Object.entries(m).sort((a, b) => b[1] - a[1]).slice(0, 80).map(([t, n]) => `${t}:${n}`) })
```

3. Nếu `total = 0` → long-tail quá hẹp, chưa có listing → rút bớt 1 từ (modifier ít quan trọng nhất) và search lại; ghi chú trong report.
4. Nếu tab bị đóng/điều hướng bất thường (popup quảng cáo) → gọi lại `tabs_context_mcp`, mở tab mới, navigate lại URL. Không dùng JS bấm nút Search.
5. Xong thì đóng tab (`tabs_close_mcp`).

**Fallback khi không có Chrome:** đưa user 3 link `?keyword=...` để tự mở → user bấm **Copy** và dán danh sách tag vào chat (không có số tần suất → xếp theo thứ tự tool trả về). Nếu user skip → ghi caveat *"⚠️ Chưa verify tag bằng topbubbleindex"*.

**2B.2 — Lọc tag (4 lớp, theo thứ tự)**

| Lớp | Loại bỏ / Giữ | Ví dụ |
|-----|---------------|-------|
| **L1 — Hard filter** | Bỏ tag >20 chars; bỏ tag dính TM/brand (vd `comfort colors`, tên nhân vật, team thể thao) | `comfort colors tee` ❌ |
| **L2 — Sai loại sản phẩm** | Bán sản phẩm vật lý → bỏ `png`, `svg`, `sublimation`, `digital download`, `design`... (và ngược lại nếu bán file số) | `cowgirl png` ❌ cho áo |
| **L3 — Lệch persona/dịp** | Bỏ tag đúng niche nhưng sai đối tượng/dịp so với design (Bước 1) | `cowboy 1st birthday` ❌ cho design "mama" |
| **L4 — Độ hỗ trợ long-tail** | Chỉ GIỮ tag **chứa ≥1 từ gốc của Long-tail CHÍNH** HOẶC chứa insider keyword Bước 1 / là gift-occasion phù hợp | `western mama` ✅, `retro cowgirl` ✅, `cowgirl style` ✅ |

**Chấm mức tần suất** (số đỏ, cho search long-tail CHÍNH): `≥10` 🟢 mạnh · `5-9` 🟢 tốt · `3-4` 🟡 ngách · `1-2` ⚪ chỉ dùng khi khớp long-tail rất sát. Tag xuất hiện ở **cả kết quả long-tail chính + phụ** → cộng ưu tiên (tag "lõi" của niche).

**2B.3 — Output: bảng Support Tags (15-20 tag sau lọc)**

| # | Tag | Chars | Tần suất (chính / phụ1 / phụ2) | Từ long-tail được hỗ trợ | Verdict |
|---|-----|-------|------------------------------|--------------------------|---------|
| 1 | western mama | 12 | 6 / 9 / – | western, mama | ✅ Tag |
| 2 | retro cowgirl | 13 | 10 / – / 4 | retro, cowgirl | ✅ Tag |
| ... | ... | ... | ... | ... | ... |

Kèm 1 dòng **"Tag bị loại"** liệt kê nhanh tag top-tần-suất đã loại + lý do (L1/L2/L3/L4) để seller thấy logic.

> ⚠️ **Coverage check:** Mỗi từ gốc của Long-tail CHÍNH (trừ product type) phải xuất hiện trong **≥2 tag** của bộ 13 tag cuối. Etsy ghép từ giữa title + tags, nên phủ đủ từ = long-tail rank mạnh hơn.
>
> ⚠️ **Không bịa tần suất.** Chỉ ghi số đọc được từ topbubbleindex; fallback không có số → ghi "–".

---

### Bước 3 — Viết Title + 13 Tags + Description

#### 3.1 — TITLE (140 ký tự max — Etsy hard limit)

**Rules (Etsy 2025-2026 algorithm):**

1. **Title MỞ ĐẦU bằng Long-tail CHÍNH (Bước 2.4) nguyên văn** — đây là frontload 40 ký tự đầu (Etsy search ưu tiên 40 char đầu trong title rank). Các cụm sau dùng Long-tail PHỤ + support tag tần suất cao từ Bước 2B.
2. **Phân tách bằng dấu `,` (comma)** — 2025-2026 best practice. KHÔNG dùng `|`, `-`, hoặc viết liền thành câu dài.
3. **Cấu trúc 5 phần:**
   - `[Long-tail CHÍNH 5-6 từ]`, `[Long-tail PHỤ / Secondary Phrase + Style]`, `[Tertiary Phrase + Persona/Niche]`, `[Occasion / Gift]`, `[Optional 5th if còn ký tự]`
4. **Không lặp từ nguyên văn** (vd không viết "cowgirl mom shirt, cowgirl mom tee" — Etsy phạt keyword stuffing).
5. **Human-readable** — buyer đọc phải hiểu ngay, không phải chuỗi keyword spam.
6. **Đếm ký tự chính xác** — title ≤140 chars (gồm khoảng trắng và dấu phẩy).

**Format mẫu:**
```
Cowgirl Mama Western Shirt, Retro Country Mom Tee, Wildflower Sunset Boho Tshirt, Mothers Day Cowgirl Gift, Rural Mom Apparel
```
→ 132/140 chars ✅

**Output:** Title hoàn chỉnh + đếm chars + giải thích frontload keyword nào.

---

#### 3.2 — TAGS (13 tags — LUÔN DÙNG HẾT 13)

**Rules:**

1. **Mỗi tag ≤20 ký tự** (Etsy hard limit, gồm khoảng trắng).
2. **Multi-word phrases > single word** — Etsy 2025 ưu tiên long-tail. Tránh tag 1 từ trừ khi cực thiết yếu.
3. **Không trùng từ y hệt giữa tags** — vd nếu có "cowgirl mom shirt" thì không có thêm "cowgirl mom tee" (cùng pattern). Đổi sang variant khác.
4. **Mix tag (xoay quanh Long-tail CHÍNH):**
   - **3 tag "mảnh" Long-tail CHÍNH** — cắt long-tail 5-6 từ thành các cụm ≤20 chars phủ hết từ gốc (vd `retro cowgirl mama western shirt` → `retro cowgirl mama`, `western mama shirt`, `cowgirl western tee`)
   - **6 Support tag** — tần suất cao nhất trong bảng 2B.3 (đã qua 4 lớp lọc)
   - **2 tag từ Long-tail PHỤ** — mảnh của long-tail phụ, không trùng pattern với tag đã có
   - **2 gift / seasonal / occasion** — ưu tiên lấy từ kết quả topbubbleindex nếu có (vd `bird watcher gift:27`)
   - Không có data 2B (đã skip) → quay về mix cũ: 3 broad + 5 niche + 3 long-tail + 2 seasonal, ghi caveat.
5. **Bao trùm 6 dimension:**
   - Theme (cowgirl, mama, witch)
   - Audience (mom, dad, teacher)
   - Style (vintage, boho, retro)
   - Occasion (mothers day, halloween)
   - Gift type (gift for mom, mama gift)
   - Product attribute (western tshirt, country tee)

**Format output:**

| # | Tag | Chars | Loại | Tần suất TBI | Lý do |
|---|-----|-------|------|-------------|-------|
| 1 | retro cowgirl mama | 18 | mảnh LT chính | – | phủ retro + cowgirl + mama |
| 2 | western mama shirt | 18 | mảnh LT chính | – | phủ western + shirt |
| 3 | retro cowgirl | 13 | support | 10 | top tần suất, chứa 2 từ LT |
| ... | ... | ... | ... | ... | ... |
| 13 | mothers day gift | 16 | gift | 3 | occasion từ TBI |

(TBI = tần suất trên topbubbleindex khi search Long-tail CHÍNH)

> ⚠️ **Check chars:** Trước khi xuất, đếm ký tự MỖI tag. Tag >20 chars là invalid.

---

#### 3.3 — DESCRIPTION

**Rules:**

1. **160 ký tự ĐẦU là vàng** — Etsy + Google snippet hiển thị 160 char đầu. Phải chứa **primary keyword** + **emotional hook** + **product type**.
2. **Cấu trúc 5 block:**
   - **Block 1 — Hook (2-3 dòng, ~160 chars):** chứa primary keyword + emotional pull + persona signal.
   - **Block 2 — Product features (bullet points):** material, print method, fit, sizing, color options.
   - **Block 3 — Gift ideas + occasions:** liệt kê 3-5 dịp phù hợp (Mother's Day, birthday, anniversary, gift for cowgirl mom...).
   - **Block 4 — Care instructions:** wash cold, tumble dry low, no bleach... (1-2 dòng).
   - **Block 5 — CTA + shipping note:** "Check shop for matching designs", processing time, etc.

3. **Keywords trải đều, tự nhiên** — đan keyword vào câu, KHÔNG nhồi 1 chỗ.
4. **Voice tone match persona** — cowgirl mom thì warm + country; sarcastic humor thì witty + edgy.
5. **300-500 từ tổng** — đủ dài để Etsy SEO crawl, không quá dài đến mức buyer bỏ qua.

**Format mẫu Block 1 (Hook):**
```
This Cowgirl Mama Western Shirt is for the rural mom who raised her babies on dirt roads, wildflowers, and Sunday faith. Retro country mom tee with vintage sunset graphic — the perfect Mother's Day gift for the cowgirl in your life.
```
→ 218 chars, 160 chars đầu chứa "Cowgirl Mama Western Shirt" + "rural mom" + "country mom" + emotional hook ✅

---

### Bước 4 — Lưu file + In inline

**4.1 — Lưu file:**

- **Path:** `~/Etsy-SEO/reports/YYYY-MM-DD_<design-slug>.md` (Windows: `C:\Users\<tên>\Etsy-SEO\reports\YYYY-MM-DD_<design-slug>.md`). Nếu thư mục chưa tồn tại → tạo mới.
- **Slug:** kebab-case từ Bước 1 (vd: `cowgirl-sunset-mama`). Nếu input là report analyze-design → dùng cùng slug để pair 2 file.
- **Format:** theo template `~/.claude/skills/etsy-seo/templates/seo_report_template.md`.

**4.2 — In inline trong chat (block dễ copy):**

```markdown
## ✅ SEO Etsy ready

**🎯 Long-tail CHÍNH** (5 từ): `retro cowgirl mama western shirt`

**Title** (132/140 chars):
> Cowgirl Mama Western Shirt, Retro Country Mom Tee, Wildflower Sunset Boho Tshirt, Mothers Day Cowgirl Gift, Rural Mom Apparel

**13 Tags:**
> cowgirl mom shirt, western mama tee, wildflower country mom, mothers day cowgirl, rural mom apparel, boho mama shirt, sunset cowgirl tee, country mom gift, western mom shirt, cowgirl gift idea, retro country mama, mama cowgirl tee, wildflower mom tee

**Description Hook** (160 chars đầu):
> This Cowgirl Mama Western Shirt is for the rural mom who raised her babies on dirt roads, wildflowers, and Sunday faith. Retro country mom tee...

📄 Full report: `~/Etsy-SEO/reports/YYYY-MM-DD_cowgirl-sunset-mama.md`
```

Nếu user nói "chỉ inline, không lưu file" → in full report trong chat, không tạo file.

---

## Output mặc định

Mặc định **lưu file + in inline block dễ copy**.

Inline block phải có **đủ các thứ để copy nhanh sang Etsy**:
0. Long-tail CHÍNH (1 dòng, ghi số từ)
1. Title (1 block)
2. 13 Tags — **1 dòng comma-separated** (vd: `tag1, tag2, tag3, ...`) để user copy-paste thẳng vào Etsy
3. Description Hook 160 chars đầu (block riêng)
4. Link clickable đến file report đầy đủ

---

## Checklist chất lượng trước khi trả lời

- [ ] Đã xem ảnh thật HOẶC đã đọc file report `[[analyze-design]]` (KHÔNG bịa).
- [ ] Bước 1: đủ 7 trường (Subject, Theme, Persona, Occasion, Emotional hook, Insider keywords, Product fit).
- [ ] Bước 2: đã gọi ≥3 tool `mcp__trends-ytuong` (research_keyword + find_trending + explore_niche, optional get_keyword_rank), HOẶC ghi rõ caveat skip.
- [ ] Bước 2: bảng keyword 15-20 candidates có phân loại đầy đủ (primary / niche / long-tail / seasonal).
- [ ] Bước 2.4: có 1 Long-tail CHÍNH 5-6 từ (≤6 từ, có product type, không TM) + 2 Long-tail PHỤ.
- [ ] Bước 2B: đã search cả 3 long-tail trên topbubbleindex (hoặc ghi caveat fallback/skip), bảng Support Tags đã qua 4 lớp lọc + dòng "Tag bị loại".
- [ ] Coverage: mỗi từ gốc của Long-tail CHÍNH có trong ≥2 tag.
- [ ] Bước 3 Title: ≤140 chars, MỞ ĐẦU bằng Long-tail CHÍNH nguyên văn, phân tách bằng comma, đếm chars chính xác.
- [ ] Bước 3 Tags: ĐỦ 13 tags, MỖI tag ≤20 chars, không trùng từ y hệt, mix 3 mảnh LT chính + 6 support + 2 LT phụ + 2 gift/seasonal.
- [ ] Bước 3 Description: 160 chars đầu chứa primary keyword + hook + product type. Đủ 5 block (hook / features / gift / care / CTA).
- [ ] Bước 4: file lưu đúng path, slug pair với analyze-design report nếu có.
- [ ] Inline chat: có Title + 13 Tags + Hook 160 chars + link file.

---

## Không làm

- KHÔNG viết SEO khi chưa có design thật (ảnh hoặc report).
- KHÔNG bỏ Bước 1 — nhảy thẳng vào keyword research dễ chọn nhầm niche.
- KHÔNG chọn Long-tail CHÍNH quá 6 từ, hoặc không có product type.
- KHÔNG lấy nguyên top tag topbubbleindex mà không lọc — top thường lẫn `png/svg/sublimation`, TM (`comfort colors`) và tag lệch persona.
- KHÔNG bịa tần suất topbubbleindex.
- KHÔNG bịa số liệu keyword volume / competition — nếu tool no data thì ghi "no data, judgement-based".
- KHÔNG nhồi keyword (keyword stuffing) — Etsy 2025-2026 phạt nặng listing có title spam.
- KHÔNG viết tag >20 chars hoặc title >140 chars (Etsy hard limit, listing sẽ bị reject).
- KHÔNG dùng tag trùng từ y hệt (vd "cowgirl mom shirt" + "cowgirl mom tee") — lãng phí 1 trong 13 slot.
- KHÔNG recommend keyword dính IP rõ ràng (Disney, Marvel, NFL, character licensed, brand slogan TM).
- KHÔNG dịch sang tiếng Việt phần title/tags/description — output tiếng Anh vì target US/EU.
- KHÔNG ép user dùng full pipeline nếu họ chỉ cần lại 1 phần (vd chỉ viết tags) — vẫn chạy Bước 1+2 ngắn gọn rồi focus vào phần cần.
