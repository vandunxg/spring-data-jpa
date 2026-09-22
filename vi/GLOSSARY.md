# Glossary — Spring Data JPA tiếng Việt

Giữ nguyên các thuật ngữ sau; dịch phần giải thích xung quanh bằng tiếng Việt.

## Nguyên tắc English-first theo ngữ cảnh

- Glossary này là **baseline, không phải whitelist**. Term kỹ thuật chưa có trong bảng vẫn có thể và nên giữ English nếu đó là cách viết chuẩn/tự nhiên hơn trong ngữ cảnh.
- Không ép Việt hóa các concept thuộc architecture, runtime, workflow hoặc domain model. Các term thường giữ English khi mang nghĩa kỹ thuật gồm: `system`, `backend`, `frontend`, `service`, `module`, `request`, `response`, `payload`, `message`, `event`, `job`, `task`, `workflow`, `upstream`, `downstream`, `sync`, `async`, `batch`, `retry`, `timeout`, `fallback`, `validation`, `mapping`, `binding`.
- Domain term như `order`, `approval`, `inventory`, `fulfillment`, `procurement`, `finance`, `payment`, `price` giữ English khi chúng là concept của system/model/API/flow; nếu chỉ mang nghĩa đời thường thì dịch theo nghĩa câu.
- Technical verbs như `validate`, `map`, `bind`, `serialize`, `deserialize`, `persist`, `flush`, `commit`, `rollback`, `retry`, `resolve`, `reserve`, `publish`, `consume`, `mock`, `override` có thể giữ English khi tự nhiên hơn.
- Không mặc định viết “bản dịch tiếng Việt (English term)” ở lần xuất hiện đầu. Term phổ biến dùng English trực tiếp; chỉ giải thích thêm khi concept khó và thực sự cần cho người đọc.
- Cùng một technical concept phải dùng nhất quán một term trong cùng file/section.


| Nhóm | Thuật ngữ giữ nguyên |
| --- | --- |
| Spring Data | Spring Data, Spring Data JPA, Spring Data Commons, repository, repository abstraction, repository interface |
| Repository API | Repository, CrudRepository, ListCrudRepository, PagingAndSortingRepository, JpaRepository, JpaSpecificationExecutor |
| JPA | JPA, Jakarta Persistence, EntityManager, EntityManagerFactory, persistence context, persistence unit, entity, embeddable |
| Query | query method, derived query, declared query, named query, JPQL, native query, SQL, query keyword, property path |
| Query annotations | @Query, @NativeQuery, @Modifying, @QueryHints, @EntityGraph, @Procedure |
| Pagination | Pageable, PageRequest, Page, Slice, Sort, ScrollPosition, Window |
| Projection | projection, interface projection, closed projection, open projection, DTO projection, dynamic projection |
| Specification | Specification, Predicate, Criteria API, CriteriaBuilder, CriteriaQuery |
| Persistence | persist, merge, flush, dirty checking, entity state, managed, detached, removed, transient |
| Transaction | transaction, @Transactional, propagation, isolation level, rollback, read-only transaction |
| Locking | optimistic locking, pessimistic locking, lock mode, @Lock, version |
| Auditing | auditing, AuditorAware, @CreatedDate, @LastModifiedDate, @CreatedBy, @LastModifiedBy |
| Envers | Envers, revision, RevisionRepository, Revision, RevisionMetadata |
| Query by Example | Query by Example, Example, ExampleMatcher, probe |
| Advanced | SpEL, Value Expression, AOT, CDI, custom repository implementation, fragment |
| Java/Spring | bean, ApplicationContext, dependency injection, annotation, interface, class, method, package, JVM, JDK |
| Build/docs | Maven, Antora, AsciiDoc, build, deploy, GitHub Pages, upstream |

Tên API, annotation, config key, JPQL/SQL keyword, command và standard phải giữ nguyên chính tả, kể cả khi không có trong bảng.
