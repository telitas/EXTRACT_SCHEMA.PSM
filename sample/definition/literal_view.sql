CREATE OR REPLACE VIEW literal_view AS
SELECT
    0.0 AS exact_numeric_literal,
    0E0 AS approximate_numeric_literal,
    'a' AS character_literal,
    N'a' AS national_character_literal,
    X'00' AS binary_literal,
    FALSE AS boolean_literal,
    DATE '1-1-1' AS date_literal,
    TIME '0:0:0' AS time_literal,
    TIMESTAMP '1-1-1 0:0:0' AS timestamp_literal,
    INTERVAL '0' AS interval_literal
;
