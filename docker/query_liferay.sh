curl --noproxy localhost -H 'Content-Type: application/json' -H "Authorization: Basic c3AxdXN1czNyOmt1ckJ2N1F9I0NkNjk="\
 -X POST http://localhost:9200/liferay-20099/LiferayDocumentType/_search?pretty=true \
 --data-binary @../query/liferay_fuzzy_query.json