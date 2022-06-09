# EXTRACT_SCHEMA.PSM interface definition

## Functions

### extract_table_as_xml(table_name CHARACTER VARYING, schema_name CHARACTER VARYING)

#### Description

Extract the table schema as XML Schema.

#### Parameters

<dl>
    <dt>table_name CHARACTER VARYING</dt>
    <dd>The table name to extract schema.</dd>
    <dt>schema_name CHARACTER VARYING(Optional)</dt>
    <dd>Specify the schema in which the table exists.(default: current)</dd>
</dl>

#### Return

<dl>
    <dt>The specified table exists</dt>
    <dd>Generated XML Schema document.</dd>
    <dt>Else</dt>
    <dd>NULL</dd>
</dl>

#### Note

If the RDBMS does not support both otpional arguments and function overloading, implement the following functions instead.

- extract_table_as_xml_in_current_schema(table_name CHARACTER VARYING)
- extract_table_as_xml(table_name CHARACTER VARYING, schema_name CHARACTER VARYING)

### extract_table_as_json(table_name CHARACTER VARYING, schema_name CHARACTER VARYING)

#### Description

Extract the table schema as JSON Schema.

This function is in preview.

#### Parameters

<dl>
    <dt>table_name CHARACTER VARYING</dt>
    <dd>The table name to extract schema.</dd>
    <dt>schema_name CHARACTER VARYING(Optional)</dt>
    <dd>Specify the schema in which the table exists.(default: current)</dd>
</dl>

#### Return

<dl>
    <dt>The specified table exists</dt>
    <dd>Generated JSON Schema document.</dd>
    <dt>Else</dt>
    <dd>NULL</dd>
</dl>

#### Note

If the RDBMS does not support both otpional arguments and function overloading, implement the following functions instead.

- extract_table_as_json_in_current_schema(table_name CHARACTER VARYING)
- extract_table_as_json(table_name CHARACTER VARYING, schema_name CHARACTER VARYING)
