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
- Cập nhật: 2026-09-19
- Đã xác nhận dịch trọn vẹn: **0 trang**

## Quy ước trạng thái

- Chỉ đánh dấu `[x]` khi toàn bộ prose của file đã được dịch và đã kiểm tra cấu trúc.
- File được copy từ English sang `vi/` nhưng chưa dịch vẫn tính là chưa dịch.
- Trang chỉ include nội dung từ Spring Data Commons không được tự động tính là đã dịch.
- Sau mỗi lần chạy `scripts/sync-spring-data-jpa-docs.sh`, cập nhật source commit và danh sách file cần review.
- Navigation chính thức tại `docs/modules/ROOT/nav.adoc` quyết định thứ tự dịch.

## Trang bắt đầu

1. [ ] `modules/ROOT/pages/index.adoc`
2. [ ] `modules/ROOT/pages/commons/upgrade.adoc`
3. [ ] `modules/ROOT/pages/jpa.adoc`
4. [ ] `modules/ROOT/pages/jpa/getting-started.adoc`
5. [ ] `modules/ROOT/pages/repositories/core-concepts.adoc`
6. [ ] `modules/ROOT/pages/repositories/definition.adoc`
7. [ ] `modules/ROOT/pages/repositories/create-instances.adoc`
8. [ ] `modules/ROOT/pages/jpa/entity-persistence.adoc`
9. [ ] `modules/ROOT/pages/repositories/query-methods-details.adoc`
10. [ ] `modules/ROOT/pages/jpa/query-methods.adoc`

Tiếp tục theo `modules/ROOT/nav.adoc`.

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
