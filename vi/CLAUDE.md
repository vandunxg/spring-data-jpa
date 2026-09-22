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
4. Ưu tiên giữ technical/domain terms bằng tiếng Anh theo ngữ cảnh. `GLOSSARY.md` là baseline, không phải whitelist; term chưa có trong glossary vẫn giữ English nếu đó là cách viết tự nhiên và chính xác hơn trong tài liệu kỹ thuật.
5. Giữ nguyên tên API, class, interface, method, package, annotation, property, identifier, command, URL, số liệu và version.
6. Dịch heading, prose, nhãn link, caption, alt text, text trong bảng và comment giải thích.
7. Không dịch executable code, output log, JPQL/SQL query, configuration key hoặc sample value có ý nghĩa kỹ thuật.
8. Không thêm tutorial, bài tập, lời bình hoặc nội dung do AI tự suy diễn vào bản dịch.

## English-first theo ngữ cảnh

Mục tiêu: bản dịch phải đọc giống tài liệu kỹ thuật do developer Việt viết, không phải bản Việt hóa từng từ.

- `GLOSSARY.md` là baseline, không phải whitelist. Term chưa có trong glossary vẫn giữ English nếu đó là technical/domain concept và cách dùng English tự nhiên, chính xác hơn trong ngữ cảnh.
- Không ép dịch một term chỉ vì có từ tiếng Việt tương đương. Ưu tiên giữ English cho các concept trong architecture, runtime, workflow và domain model như `system`, `backend`, `frontend`, `service`, `module`, `request`, `response`, `payload`, `repository`, `entity`, `transaction`, `query`, `filter`, `handler`, `listener`, `message`, `event`, `job`, `task`, `workflow`, `upstream`, `downstream`, `sync`, `async`, `batch`, `retry`, `timeout`, `fallback`, `cache`, `validation`, `mapping`, `binding`, `build`, `deploy`.
- Với domain/business workflow, ưu tiên term mà system/team dùng như một concept: `order`, `approval`, `inventory`, `fulfillment`, `procurement`, `finance`, `payment`, `price`, ... nếu Việt hóa làm mất tính nhất quán với model/API/flow.
- Technical verbs có thể giữ English khi cách đó tự nhiên và chính xác hơn: `validate`, `map`, `bind`, `serialize`, `deserialize`, `persist`, `flush`, `commit`, `rollback`, `retry`, `resolve`, `reserve`, `publish`, `consume`, `mock`, `override`.
- Dịch phần ngữ pháp, liên từ và diễn giải thông thường sang tiếng Việt. Mục tiêu là một câu tiếng Việt có English technical terms đúng chỗ, không phải biến cả câu thành English.
- Quyết định theo meaning trong câu, không theo token. Ví dụ: `request` là HTTP/domain object thì giữ `request`; “request access” dùng như động từ thông thường có thể dịch là “yêu cầu quyền truy cập”. `order` là domain entity thì giữ `order`; “in order to” phải dịch theo nghĩa ngữ pháp.
- Một concept dùng một term nhất quán trong cùng file/section. Không xen kẽ `request`/“yêu cầu”, `transaction`/“giao dịch”, `repository`/“kho lưu trữ” nếu đang nói cùng technical concept.
- Không tự thêm bản dịch tiếng Việt trong ngoặc sau mỗi English term. Chỉ giải thích ở lần đầu nếu concept khó và source/ngữ cảnh thực sự cần làm rõ.
- API/type/identifier giữ đúng casing gốc như `Authentication`, `JpaRepository`; prose term dùng casing thông thường như `request`, `transaction`, `repository`.

Ví dụ style mục tiêu:

> System chủ yếu phục vụ nhân viên procurement và finance, phụ trách tra cứu sản phẩm, tạo order, approval, đồng bộ trạng thái thanh toán và tra cứu fulfillment. Backend được tách thành các module order, inventory và approval; khi tạo order, trước tiên sẽ validate request và price, sau đó tạo order và reserve inventory. Sau khi thành công, system gửi message để downstream hoàn thành các task async như thông báo approval.

Không sửa meaning của source chỉ để làm câu “kỹ thuật hơn”; chỉ giữ English khi term đó thực sự là technical/domain concept trong ngữ cảnh.


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
