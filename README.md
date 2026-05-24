# SEO Etsy — Workspace

Folder lưu output của skill `etsy-seo` — viết Title + 13 Tags + Description chuẩn SEO Etsy cho design POD.

## Cấu trúc

```
SEO Etsy/
├── README.md                          ← file này
├── reports/                           ← 1 design = 1 file SEO report
│   └── YYYY-MM-DD_<design-slug>.md
└── templates/
    └── seo_report_template.md         ← template chuẩn
```

## Pipeline 4 bước (skill `etsy-seo`)

1. **Bước 1 — Design Insight Snapshot:** trích 7 trường (Subject, Theme, Persona, Occasion, Hook, Insider keywords, Product fit). Đọc từ ảnh HOẶC từ report `analyze-design`.
2. **Bước 2 — Keyword Research:** gọi `mcp__trends-ytuong` (research_keyword, find_trending, explore_niche, find_hidden_gems, get_keyword_rank). Xuất bảng 15-20 candidate.
3. **Bước 3 — Viết SEO:**
   - **Title** ≤140 chars, frontload 40 chars đầu, phân tách bằng comma.
   - **13 Tags**, mỗi ≤20 chars, mix 3 broad + 5 niche + 3 long-tail + 2 seasonal.
   - **Description** với 160 chars đầu = meta, đủ 5 block (hook / features / gift / care / CTA).
4. **Bước 4 — Lưu file + In inline block** dễ copy vào Etsy.

## Pair với `analyze-design`

Nếu design đã có report `analyze-design` → skill `etsy-seo` đọc lại report, dùng cùng slug để pair 2 file:

```
Analyze Design/reports/2026-05-21_cowgirl-sunset-mama.md   ← full analysis
SEO Etsy/reports/2026-05-21_cowgirl-sunset-mama.md         ← SEO listing
```

## Cách dùng

- Gõ `/etsy-seo` trong Claude Code, gửi ảnh design HOẶC paste path report analyze-design.
- Hoặc nói tự nhiên: "viết SEO Etsy cho design này" + gửi ảnh.

## Etsy SEO rules (quick reference)

| Field | Hard limit | Best practice |
|-------|-----------|---------------|
| Title | 140 chars | Frontload 40 chars đầu, phân tách `,`, không nhồi keyword |
| Tags | 13 tags × 20 chars | Long-tail > single word, không trùng từ y hệt |
| Description hook | 160 chars đầu | Primary keyword + emotional hook + product type |
| Description total | 300-500 từ | 5 block: hook / features / gift / care / CTA |
