CREATE TABLE notnull_table (
    character_varying_column CHARACTER VARYING(10) NOT NULL,
    character_large_object_column CHARACTER LARGE OBJECT NOT NULL,
    binary_varying_column BINARY VARYING NOT NULL,
    binary_large_object_column BINARY LARGE OBJECT NOT NULL,
    not_supported_type_column NOT SUPPORTED TYPE NOT NULL
);
