CREATE TABLE sample_table (
    product_id NUMERIC(8) PRIMARY KEY,
    product_code CHARACTER(12) NOT NULL UNIQUE,
    product_name NATIONAL CHARACTER VARYING(30),
    price NUMERIC(15, 3),
    on_sale BOOLEAN NOT NULL,
    registered_at TIMESTAMP WITH TIME ZONE NOT NULL,
    note CHARACTER LARGE OBJECT
);
