# Tiến độ dịch Spring Data JPA

- Repository: `vandunxg/spring-data-jpa`
- Branch làm việc hiện tại: `main`
- Official upstream: `spring-projects/spring-data-jpa`
- Upstream branch: `main`
- Source commit khởi tạo: `97f99da01a00348541fb1980004866c5439aafa2`
- Spring Data Commons commit: `d4c9f0604550c30078b7d47ede453431096b03aa`
- English source: `docs/modules/`
- Vietnamese source: `vi/modules/`
- Commons mirror: `vendor/data-commons/`
- Cập nhật: 2026-09-20
- Đã xác nhận dịch trọn vẹn: **26 / 26 trang có prose JPA riêng** (100%)
- Website build (`npm run build`, `failure_level: warn`): đã chạy và PASS, không có warning/error (anchor, xref, include, attribute đều resolve đúng).

## Quy ước trạng thái

- Chỉ đánh dấu `[x]` khi toàn bộ prose của file đã được dịch và đã kiểm tra cấu trúc.
- File được copy từ English sang `vi/` nhưng chưa dịch vẫn tính là chưa dịch.
- Trang chỉ include nội dung từ Spring Data Commons không được tự động tính là đã dịch.
- Sau mỗi lần chạy `scripts/sync-spring-data-jpa-docs.sh`, cập nhật source commit và danh sách file cần review.
- Navigation chính thức tại `docs/modules/ROOT/nav.adoc` quyết định thứ tự dịch.

## Trang đã dịch (theo thứ tự `nav.adoc`)

1. [x] `modules/ROOT/pages/index.adoc`
2. [x] `modules/ROOT/pages/jpa.adoc`
3. [x] `modules/ROOT/pages/jpa/getting-started.adoc`
4. [x] `modules/ROOT/pages/repositories/create-instances.adoc`
5. [x] `modules/ROOT/pages/jpa/entity-persistence.adoc`
6. [x] `modules/ROOT/pages/jpa/query-methods.adoc` — có 1 dòng `include::{commons}@data-commons::page$repositories/scrolling.adoc[]` ở cuối, giữ nguyên.
7. [x] `modules/ROOT/pages/repositories/projections.adoc` — có include commons xen giữa prose.
8. [x] `modules/ROOT/pages/jpa/stored-procedures.adoc`
9. [x] `modules/ROOT/pages/jpa/specifications.adoc`
10. [x] `modules/ROOT/pages/repositories/query-by-example.adoc` — có include commons xen giữa prose.
11. [x] `modules/ROOT/pages/repositories/vector-search.adoc` — trang chỉ set attribute + `include::partial$vector-search.adoc[]`, không đổi. Toàn bộ prose thật nằm ở `modules/ROOT/partials/vector-search*.adoc` (7 file, đã dịch đủ; riêng `vector-search-model-include.adoc` không có prose, chỉ có code nên giữ nguyên).
12. [x] `modules/ROOT/pages/jpa/transactions.adoc`
13. [x] `modules/ROOT/pages/jpa/locking.adoc`
14. [x] `modules/ROOT/pages/auditing.adoc` — có include commons ở đầu file, giữ nguyên.
15. [x] `modules/ROOT/pages/jpa/misc-merging-persistence-units.adoc`
16. [x] `modules/ROOT/pages/jpa/jpd-misc-cdi-integration.adoc`
17. [x] `modules/ROOT/pages/repositories/custom-implementations.adoc` — có include commons ở đầu file, giữ nguyên.
18. [x] `modules/ROOT/pages/repositories/core-extensions.adoc` — có include commons xen giữa prose.
19. [x] `modules/ROOT/pages/repositories/query-return-types-reference.adoc` — có include commons xen giữa prose.
20. [x] `modules/ROOT/pages/jpa/aot.adoc` — có include commons ở đầu file, giữ nguyên.
21. [x] `modules/ROOT/pages/jpa/faq.adoc`
22. [x] `modules/ROOT/pages/jpa/glossary.adoc`
23. [x] `modules/ROOT/pages/envers.adoc`
24. [x] `modules/ROOT/pages/envers/introduction.adoc`
25. [x] `modules/ROOT/pages/envers/configuration.adoc`
26. [x] `modules/ROOT/pages/envers/usage.adoc`

## Trang phụ thuộc hoàn toàn vào Spring Data Commons (không tính là "trang dịch" theo `CLAUDE.md`)

Các trang sau chỉ chứa `include::{commons}@data-commons::page$...[]` (không có prose JPA riêng), nên nội dung hiển thị phụ thuộc bản dịch của `vendor/data-commons/` — một scope riêng.

- `modules/ROOT/pages/commons/upgrade.adoc`
- `modules/ROOT/pages/repositories/core-concepts.adoc`
- `modules/ROOT/pages/repositories/definition.adoc`
- `modules/ROOT/pages/repositories/query-methods-details.adoc`
- `modules/ROOT/pages/jpa/value-expressions.adoc`
- `modules/ROOT/pages/repositories/core-domain-events.adoc`
- `modules/ROOT/pages/repositories/null-handling.adoc`
- `modules/ROOT/pages/repositories/query-keywords-reference.adoc`

## Việc còn mở (theo dõi tiếp)

- **Nhất quán nhãn xref (`xref:...[Label]`)**: đã rà soát toàn bộ 26 trang. Kết luận: nhãn xref trỏ tới trang đã dịch (nằm trong 26 trang ở trên) phải dịch sang tiếng Việt; nhãn trỏ tới trang phụ thuộc Commons chưa dịch (`repositories/core-concepts.adoc`, `repositories/query-methods-details.adoc`, `repositories/custom-implementations.adoc` — trang này bản thân chỉ include Commons rồi thêm một section JPA nhỏ, tiêu đề trang vẫn là tiếng Anh) thì giữ nguyên nhãn tiếng Anh cho khớp với heading thật sự sẽ hiển thị khi click qua. Đã sửa 1 chỗ lệch thật sự: `jpa/query-methods.adoc` dòng 15, nhãn tự tham chiếu `[Using Value Expressions]` → `[Sử dụng Value Expression]` (trỏ tới heading `== Templated Query và Expression` đã dịch trong cùng file). Không còn trường hợp nhãn tiếng Anh trỏ tới trang đã dịch.
- Đã dịch đủ 41/41 file Commons vào `vi/vendor/data-commons/modules/ROOT/pages/`.
- Đã wire 20 Commons include của source tiếng Việt sang component `data-commons-vi`; English source vẫn dùng component `data-commons`.

## Kiểm tra chất lượng

Mỗi batch phải kiểm tra tối thiểu:

- anchor/ID không bị thay đổi;
- xref/include target không bị thay đổi;
- code block, JPQL, SQL và command không bị dịch;
- resource family như `page$`, `partial$`, `attachment$`, `example$` giữ nguyên;
- include sang `data-commons` giữ nguyên;
- tên API, annotation, class, method và query keyword giữ nguyên;
- không lược bỏ câu, bảng, list, note/warning hoặc conditional;
- website build riêng được kiểm tra độc lập với trạng thái dịch.

Lần dịch này đã kiểm tra: số dòng, số heading, số source block, số bảng `|===`, số anchor, số admonition (NOTE/WARNING/TIP/IMPORTANT), số callout giữa `docs/` và `vi/` cho từng file (khớp 1:1), cộng với build Antora toàn bộ site (`npm run build`) pass không lỗi/warning.
