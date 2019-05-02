# README
Steps to building a simple API

- Models / Migrations
  - Need fields and data-types, including references
- Serializers
  - Which Fields to include
  - Which relationships to auto include
- Routes
  - Which nested resources to include
  - Find

- From csv task

```
table :name, columns: {col_name: type, ...}, expose: {not/only: [col_names]}, find_by: {not/only: [col_names]}, seed_file, conversions: {col_name: :method symbol} # Use standard rails model g types
```
Do something for the many-to-many resources
```

```
