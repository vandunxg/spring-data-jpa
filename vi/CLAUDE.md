# Quy tắc dịch Spring Data JPA sang tiếng Việt

Kế thừa cấu trúc và nguyên tắc từ `vandunxg/spring-security/vi/CLAUDE.md`, điều chỉnh cho Spring Data JPA.

## Phạm vi và nguồn

- Chỉ làm việc trên `vandunxg/spring-data-jpa`.
- English source nằm dưới `docs/`; bản dịch chỉ ghi dưới `vi/`.
- Source upstream chính thức: `spring-projects/spring-data-jpa`, nhánh `main`.
- Một phần nội dung được include từ Spring Data Commons, mirror dưới `vendor/data-commons/`.
- Mapping: `docs/modules/<module>/<family>/<path>` thành `vi/modules/<module>/<family>/<path>`.
- Dịch theo `docs/modules/ROOT/nav.adoc` từ đầu đến cuối.
- Một trang là một file trong family `pages/`. Không tính navigation, partial, attachment, glossary, progress hoặc code sample thành trang dịch.
- File trong `vi/` chỉ được đánh dấu đã dịch khi toàn bộ prose của trang đã được dịch; file copy nguyên English không được tính.

## Nội dung

1. Đọc toàn bộ file gốc trước khi dịch. Không dịch từ tiêu đề, snippet rời rạc hoặc kiến thức nhớ lại.
2. Dịch đầy đủ, không tóm tắt, không thêm ý, không bỏ ví dụ, cảnh báo, điều kiện, bảng hoặc danh sách.
3. Văn phong kỹ thuật, trực tiếp, tự nhiên; không kéo dài câu không cần thiết.
4. Giữ thuật ngữ chuyên ngành bằng tiếng Anh theo `GLOSSARY.md`; dịch phần diễn giải xung quanh.
5. Giữ nguyên tên API, class, interface, method, package, annotation, property, identifier, command, URL, số liệu và version.
6. Dịch heading, prose, nhãn link, caption, alt text, text trong bảng và comment giải thích.
7. Không dịch executable code, output log, JPQL/SQL query, configuration key hoặc sample value có ý nghĩa kỹ thuật.
8. Không thêm tutorial, bài tập, lời bình hoặc nội dung do AI tự suy diễn vào bản dịch.

## Spring Data JPA

Giữ nguyên các thuật ngữ và tên chuẩn như `Repository`, `CrudRepository`, `JpaRepository`, `EntityManager`, `EntityManagerFactory`, `PersistenceContext`, `Specification`, `JpaSpecificationExecutor`, `Query by Example`, `Pageable`, `Sort`, `Slice`, `Page`, `Projection`, `Auditing`, `Envers`, `JPQL`, JPA và Jakarta Persistence.

Phải phân biệt chính xác:
- entity và repository;
- derived query method và declared query;
- JPQL và native SQL;
- persistence context và transaction;
- `Page`, `Slice`, `List` và `Stream`;
- interface projection, DTO projection và dynamic projection;
- JPA Specification và Query by Example;
- optimistic locking và pessimistic locking.

Không tự đổi API cũ sang API mới nếu source chưa đổi. Nội dung migration/deprecation phải bám sát đúng version upstream.

## Nội dung từ Spring Data Commons

Spring Data JPA tái sử dụng nhiều trang từ component Commons thông qua các include dạng:

`include::{commons}@data-commons::page$...`

Trong source English, component là `data-commons`. Trong source tiếng Việt,
component tương ứng là `data-commons-vi` và nội dung được dịch dưới
`vi/vendor/data-commons/`.

Quy tắc:

- Không xóa target page hoặc resource family của include. Source English giữ
  target `data-commons`; source tiếng Việt dùng target tương ứng
  `data-commons-vi` để render bản dịch.
- Không tự copy nội dung Spring Data Commons vào trang JPA để "làm đầy" tài liệu.
- Nếu trang JPA chỉ include toàn bộ nội dung từ Commons và không có prose JPA bổ sung, ghi rõ trong `PROGRESS.md` rằng nội dung phụ thuộc `vendor/data-commons/`.
- Bản dịch Commons dành cho website tiếng Việt phải nằm trong component
  `data-commons-vi`, không trộn trực tiếp vào prose JPA.
- Không suy diễn nội dung khi include chưa resolve được.

## AsciiDoc và Antora

Giữ nguyên explicit anchor/ID, xref target, include target, attribute reference, macro, conditional directive, source language, delimiter, callout, role, config key và file path. Chỉ dịch text hiển thị.

Các resource reference như `page$`, `partial$`, `attachment$`, `example$`, `image$` phải được giữ nguyên.

Giữ nguyên:
- annotation như `@Query`, `@Entity`, `@Transactional`, `@Modifying`, `@Lock`;
- repository method signature;
- JPQL/SQL;
- SpEL expression;
- named query;
- property path;
- query keyword;
- generic type;
- package/class/method reference.

Không đổi slug/path để Việt hóa URL.

## Đồng bộ upstream

- `scripts/sync-spring-data-jpa-docs.sh` là entrypoint để sync English JPA docs.
- `scripts/sync-spring-data-commons-docs.sh` sync dependency docs từ Spring Data Commons.
- `.upstream-version` lưu commit Spring Data JPA đã sync.
- `.commons-upstream-version` lưu commit Spring Data Commons đã sync.
- Không sửa các version file bằng tay.
- `docs/antora.yml` là descriptor local dành cho docs-only build và không bị script sync ghi đè.
- Sau mỗi lần sync, chỉ dịch những file thực sự thay đổi trong `docs/modules/`.

## Tiến độ và kiểm tra

- `PROGRESS.md` ghi trạng thái thực tế, source commit và file tiếp theo.
- Không đánh dấu trang đã dịch chỉ vì file tồn tại.
- Phân biệt rõ: dịch nội dung, kiểm tra cấu trúc, build website và deploy.
- Không ghi build/deploy thành công nếu chưa chạy và xác minh.
- Đối chiếu số section, anchor, xref, include, source block, bảng, danh sách, admonition và conditional với source.
- Nội dung code block, JPQL và SQL phải giữ nguyên trừ khi source upstream thay đổi.
