# Spring Data JPA — Tài liệu tiếng Việt

Bản dịch không chính thức từ tài liệu Spring Data JPA chính thức trong fork `vandunxg/spring-data-jpa`.

- Quy tắc dịch: [CLAUDE.md](CLAUDE.md)
- Tiến độ: [PROGRESS.md](PROGRESS.md)
- Thuật ngữ: [GLOSSARY.md](GLOSSARY.md)
- Navigation: [modules/ROOT/nav.adoc](modules/ROOT/nav.adoc)
- Trang bắt đầu: [modules/ROOT/pages/index.adoc](modules/ROOT/pages/index.adoc)

Mapping:

`docs/modules/ROOT/pages/jpa/query-methods.adoc`

→

`vi/modules/ROOT/pages/jpa/query-methods.adoc`

`docs/` là English source được đồng bộ từ official Spring Data JPA upstream. `vi/` giữ bản dịch tiếng Việt.

Một phần reference documentation của Spring Data JPA include nội dung từ Spring Data Commons. Dependency đó được mirror riêng dưới `vendor/data-commons/`; không chỉnh sửa trực tiếp nội dung mirror trong quá trình dịch JPA.

Giữ nguyên cấu trúc AsciiDoc/Antora, anchor, xref, include, JPQL/SQL và code sample để English/Vietnamese có thể build chung.
