Create or update a document
PUT /my_index_name/_doc/12abc
{
  "title": "Elastic is funny",
  "tag": [
    "lucene"
  ]
}

https://books.google.com.co/books?id=AzqbDwAAQBAJ&pg=PR2&lpg=PR2&dq=elasticsearch+kibana+create+document+with+custom+id&source=bl&ots=5pezJcaKpp&sig=ACfU3U0tkMhYhA64LqtgoZ9sUPMZhLEGQA&hl=es-419&sa=X&ved=2ahUKEwjXvZiwzsDqAhVvmuAKHcAVDRw4FBDoATADegQIChAB#v=onepage&q=insert&f=false

https://discuss.elastic.co/t/creating-a-custom-id-in-a-mapping/65460
PUT pdf_docs
{ "settings": {
  "number_of_shards": 12,
  "number_of_replicas": 2
},
"mappings": {
"pdf_docs": {
  "_id" : {
            "path" : "ID"
        },
  "properties": {
    "DESCRIPTIONS": {
      "type": "string",
      "index": "not_analyzed"
    },
    "VALUES": {
      "type": "string",
      "index": "not_analyzed"
    },
    "COLUMN-3": {
      "type": "string",
      "index": "not_analyzed"
    },
    "LUMN-4": {
      "type": "string",
      "index": "not_analyzed"
    }
  }}}}
