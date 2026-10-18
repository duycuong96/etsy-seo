# Etsy SEO POD — Pipeline 4 bước (bản ChatGPT Custom GPT)

Quy trình viết **Title + 13 Tags + Description** chuẩn SEO Etsy cho design POD (t-shirt, hoodie, sticker, poster, mug, tote). Nghiên cứu design trước → keyword + long-tail → support tags → mới viết SEO.

> ⚠️ **Đầu vào bắt buộc:** ảnh design HOẶC report phân tích design (text/file .md). Chưa có → hỏi user, không bịa.
>
> 🔁 **Khác bản Claude gốc:** GPT dùng MCP **ytrends + EverBee** cho keyword và tag top listing; không điều khiển được trình duyệt (topbubbleindex thành tuỳ chọn, user tự copy) và không lưu file vào máy (file .md tải về qua Code Interpreter).

---

## Đầu vào — chỉ hỏi khi thật cần

1. **Design source** (bắt buộc): ảnh hoặc report phân tích design.
2. **Product type chính** (optional): mặc định t-shirt.
3. **Niche / persona** (optional): mặc định tự suy từ design.
4. **Data keyword:** GPT tự gọi MCP **ytrends + EverBee**. User có thể dán thêm eRank / Marmalead.
5. **Tag topbubbleindex** (optional): GPT đưa link verify thêm, user tự copy dán vào. Không bắt buộc.
6. **File report**: mặc định in trong chat. User yêu cầu → xuất file `.md` cho tải về.

---

## Pipeline 4 bước (THỰC THI THEO THỨ TỰ)

### Bước 1 — Design Insight Snapshot (tóm tắt cho SEO)

Mục tiêu: trích ra **đủ thông tin để chọn đúng keyword**, KHÔNG cần đủ 11 khía cạnh style như report phân tích design.

**Trường hợp A — Input là file report từ report phân tích design:**
- Đọc report user gửi (dán text hoặc upload file).
- Trích các section: `Cultural Context`, `Design Insight (4W + Meaning + Why it sells)`, `Marketing Report` (nếu có).
- Tóm tắt thành 7 trường ở dạng bảng — KHÔNG phân tích lại từ đầu.

**Trường hợp B — Input là ảnh design:**
- Xem kỹ ảnh user gửi.
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

### Bước 2 — Keyword Research

> ⚙️ Mặc định **BẮT BUỘC** dùng data thật từ MCP ytrends + EverBee. MCP không chạy → ghi caveat: *"⚠️ Keyword dựa trên Web Search/judgement, recommend cross-check bằng EverBee/eRank trước khi launch."*

**2.1 — Gọi MCP theo thứ tự (mặc định chạy luôn, không hỏi user):**

1. **ytrends `ytrends_research_keyword`** — 2-3 keyword cốt lõi rút từ Bước 1 (vd "cowgirl mom shirt", "western mama tee"). Lấy volume, competition, related keywords.
2. **ytrends `ytrends_find_trending_keywords`** — niche từ Bước 1. Lấy keyword đang trend tháng này.
3. **ytrends `ytrends_explore_niche`** — cluster keyword cùng niche → long-tail variants.
4. **ytrends `ytrends_find_hidden_gems`** — long-tail low-competition.
5. **EverBee MCP — tool keyword research** — chạy cho 5-10 candidate chính → monthly searches, competition, keyword score. Xem top listing của long-tail để biết đối thủ đang dùng title/tag gì.
6. **ytrends `ytrends_get_keyword_rank`** (optional) — verify 3-5 keyword cuối.

**Hai nguồn lệch số:** ghi cả 2, ưu tiên EverBee cho volume, ytrends cho trend/momentum.

**Fallback khi MCP lỗi:** data user dán (eRank / Marmalead) → Web Search `<keyword> site:etsy.com` → judgement. Ghi rõ nguồn đã dùng.

**2.2 — Xuất bảng keyword candidates (15-20 keyword):**

| # | Keyword | Vol (EverBee) | Comp | Trend (ytrends) | Loại | Verdict |
|---|---------|---------------|------|-----------------|------|---------|
| 1 | cowgirl mom shirt | 2,400 | medium | ↑ rising | primary | ✅ Title + Tag |
| 2 | western mama tee | 880 | low | stable | primary | ✅ Title + Tag |
| 3 | wildflower country mom | 140 | very low | hidden gem | long-tail | ✅ Tag |
| 4 | mothers day cowgirl gift | 590 | medium | seasonal (T3-T5) | seasonal | ✅ Title + Tag |
| ... | ... | ... | ... | ... | ... | ... |

(Số trong bảng mẫu chỉ minh hoạ format — khi chạy thật chỉ ghi số MCP trả về.)

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
| CHÍNH | retro cowgirl mama western shirt | 5 | 32 | ytrends + EverBee + insider kw |
| Phụ 1 | ... | ... | ... | ... |
| Phụ 2 | ... | ... | ... | ... |

---

### Bước 2B — Tag của top listing (EverBee) → Lọc tag hỗ trợ

> 🎯 Mục tiêu: lấy **tag mà các listing top Etsy đang dùng cho chính long-tail đó**, rồi lọc ra tag **hỗ trợ tốt** cho long-tail chính. Nguồn chính: EverBee; verify thêm bằng topbubbleindex nếu user dán.
>
> Tần suất = **số listing top đang dùng tag đó** cho từ khoá search → càng cao càng được thị trường xác nhận.

**2B.1 — Lấy tag từ top listing**

1. **EverBee (chính):** search Long-tail CHÍNH, rồi 2 Long-tail PHỤ → lấy tag của các listing top. Tần suất = số listing top dùng tag đó (đếm từ data EverBee trả về, gộp hoa/thường).
2. **ytrends `ytrends_explore_niche` / related keywords:** bổ sung cụm liên quan.
3. **topbubbleindex (tuỳ chọn verify):** đưa user 3 link `https://www.topbubbleindex.com/etsy/etsy-tag-generator?keyword=<long-tail>` (khoảng trắng = `%20`). User mở → bấm Copy → dán lại. Không bắt buộc, không chờ.

- Long-tail quá hẹp (không ra listing) → bỏ bớt 1 từ modifier ít quan trọng nhất, search lại, ghi chú.
- Không có tag từ nguồn nào → judgement + caveat *"⚠️ Tag chưa verify bằng data top listing"*.

**2B.2 — Lọc tag (4 lớp, theo thứ tự)**

| Lớp | Loại bỏ / Giữ | Ví dụ |
|-----|---------------|-------|
| **L1 — Hard filter** | Bỏ tag >20 chars; bỏ tag dính TM/brand (vd `comfort colors`, tên nhân vật, team thể thao) | `comfort colors tee` ❌ |
| **L2 — Sai loại sản phẩm** | Bán sản phẩm vật lý → bỏ `png`, `svg`, `sublimation`, `digital download`, `design`... (và ngược lại nếu bán file số) | `cowgirl png` ❌ cho áo |
| **L3 — Lệch persona/dịp** | Bỏ tag đúng niche nhưng sai đối tượng/dịp so với design (Bước 1) | `cowboy 1st birthday` ❌ cho design "mama" |
| **L4 — Độ hỗ trợ long-tail** | Chỉ GIỮ tag **chứa ≥1 từ gốc của Long-tail CHÍNH** HOẶC chứa insider keyword Bước 1 / là gift-occasion phù hợp | `western mama` ✅, `retro cowgirl` ✅, `cowgirl style` ✅ |

**Chấm mức tần suất** (số listing top dùng tag, cho search long-tail CHÍNH): `≥10` 🟢 mạnh · `5-9` 🟢 tốt · `3-4` 🟡 ngách · `1-2` ⚪ chỉ dùng khi khớp long-tail rất sát. Tag xuất hiện ở **cả kết quả long-tail chính + phụ** → cộng ưu tiên (tag "lõi" của niche).

**2B.3 — Output: bảng Support Tags (15-20 tag sau lọc)**

| # | Tag | Chars | Tần suất (chính / phụ1 / phụ2) | Từ long-tail được hỗ trợ | Verdict |
|---|-----|-------|------------------------------|--------------------------|---------|
| 1 | western mama | 12 | 6 / 9 / – | western, mama | ✅ Tag |
| 2 | retro cowgirl | 13 | 10 / – / 4 | retro, cowgirl | ✅ Tag |
| ... | ... | ... | ... | ... | ... |

Kèm 1 dòng **"Tag bị loại"** liệt kê nhanh tag top-tần-suất đã loại + lý do (L1/L2/L3/L4) để seller thấy logic.

> ⚠️ **Coverage check:** Mỗi từ gốc của Long-tail CHÍNH (trừ product type) phải xuất hiện trong **≥2 tag** của bộ 13 tag cuối. Etsy ghép từ giữa title + tags, nên phủ đủ từ = long-tail rank mạnh hơn.
>
> ⚠️ **Không bịa tần suất.** Chỉ ghi số đếm được từ EverBee / topbubbleindex; không có số → ghi "–".

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

### Bước 4 — Output

**4.1 — In trong chat (mặc định):** report đầy đủ theo `seo-report-template.md`, kết thúc bằng block copy nhanh bên dưới.

**4.2 — File (khi user yêu cầu):** dùng Code Interpreter tạo file `YYYY-MM-DD_<design-slug>.md` theo template, đưa link tải. Slug kebab-case từ Bước 1 (vd `cowgirl-sunset-mama`).

**4.3 — Đếm ký tự bằng code (bắt buộc trước khi xuất):** dùng Python `len()` cho title, từng tag, 160 ký tự đầu description và số từ description. Vi phạm → sửa → đếm lại.

```markdown
## ✅ SEO Etsy ready

**🎯 Long-tail CHÍNH** (5 từ): `retro cowgirl mama western shirt`

**Title** (132/140 chars):
> Cowgirl Mama Western Shirt, Retro Country Mom Tee, Wildflower Sunset Boho Tshirt, Mothers Day Cowgirl Gift, Rural Mom Apparel

**13 Tags:**
> cowgirl mom shirt, western mama tee, wildflower country mom, mothers day cowgirl, rural mom apparel, boho mama shirt, sunset cowgirl tee, country mom gift, western mom shirt, cowgirl gift idea, retro country mama, mama cowgirl tee, wildflower mom tee

**Description Hook** (160 chars đầu):
> This Cowgirl Mama Western Shirt is for the rural mom who raised her babies on dirt roads, wildflowers, and Sunday faith. Retro country mom tee...
```

---

## Checklist chất lượng trước khi trả lời

- [ ] Đã xem ảnh thật HOẶC đọc report phân tích design (KHÔNG bịa).
- [ ] Bước 1: đủ 7 trường (Subject, Theme, Persona, Occasion, Emotional hook, Insider keywords, Product fit).
- [ ] Bước 2: đã gọi ytrends (research_keyword + find_trending + explore_niche, ± find_hidden_gems / get_keyword_rank) + EverBee keyword research, HOẶC ghi rõ caveat fallback.
- [ ] Bước 2: bảng 15-20 keyword candidates phân loại đủ (primary / niche / long-tail / seasonal).
- [ ] Bước 2.4: 1 Long-tail CHÍNH 5-6 từ (≤6 từ, có product type, không TM) + 2 Long-tail PHỤ.
- [ ] Bước 2B: đã lấy tag top listing từ EverBee (± topbubbleindex user dán), qua 4 lớp lọc + dòng "Tag bị loại" (hoặc caveat).
- [ ] Coverage: mỗi từ gốc của Long-tail CHÍNH có trong ≥2 tag.
- [ ] Title: ≤140 chars, MỞ ĐẦU bằng Long-tail CHÍNH nguyên văn, phân tách bằng comma, đã đếm bằng code.
- [ ] Tags: ĐỦ 13, MỖI tag ≤20 chars (đếm bằng code), không trùng pattern, đúng mix.
- [ ] Description: 160 chars đầu chứa primary keyword + hook + product type; đủ 5 block; 300-500 từ.
- [ ] Block copy nhanh: Long-tail CHÍNH + Title + 13 Tags 1 dòng + Hook 160 chars + Full description.

---

## Không làm

- KHÔNG viết SEO khi chưa có design thật (ảnh hoặc report).
- KHÔNG bỏ Bước 1 — nhảy thẳng vào keyword research dễ chọn nhầm niche.
- KHÔNG chọn Long-tail CHÍNH quá 6 từ, hoặc không có product type.
- KHÔNG lấy nguyên top tag (EverBee / topbubbleindex) mà không lọc — top thường lẫn `png/svg/sublimation`, TM (`comfort colors`) và tag lệch persona.
- KHÔNG bịa tần suất tag.
- KHÔNG bịa số liệu keyword volume / competition — nếu tool no data thì ghi "no data, judgement-based".
- KHÔNG nhồi keyword (keyword stuffing) — Etsy 2025-2026 phạt nặng listing có title spam.
- KHÔNG viết tag >20 chars hoặc title >140 chars (Etsy hard limit, listing sẽ bị reject).
- KHÔNG dùng tag trùng từ y hệt (vd "cowgirl mom shirt" + "cowgirl mom tee") — lãng phí 1 trong 13 slot.
- KHÔNG recommend keyword dính IP rõ ràng (Disney, Marvel, NFL, character licensed, brand slogan TM).
- KHÔNG dịch sang tiếng Việt phần title/tags/description — output tiếng Anh vì target US/EU.
- KHÔNG ép user dùng full pipeline nếu họ chỉ cần lại 1 phần (vd chỉ viết tags) — vẫn chạy Bước 1+2 ngắn gọn rồi focus vào phần cần.
