# FOR DEVELOPER

## Develop environment

This project uses the following tools.

|Category                      |Name                                                |
|------------------------------|----------------------------------------------------|
|ShellScript Testing framework |[Bats-core](https://github.com/bats-core/bats-core) |
|XML linter/validator/formatter|[xmllint](http://xmlsoft.org/)                      |
|JSON linter/validator         |[ajv](https://ajv.js.org/)                          |
|JSON formatter                |[jq](https://stedolan.github.io/jq/)                |

## Translation Guidelines

### XML Schema

This project currently uses 1.0.

#### Types

|Type in SQL                  |Type representation in XML Schema                                               |
|-----------------------------|--------------------------------------------------------------------------------|
|`NUMERIC`                    |`decimal` with `totalDigits` and `fractionDigits` restriction                   |
|`DECIMAL`                    |`decimal` with `totalDigits` and `fractionDigits` restriction                   |
|`SMALLINT`                   |`integer` or subtype (may be with `minInclusive` and `maxInclusive` restriction)|
|`INTEGER`                    |`integer` or subtype (may be with `minInclusive` and `maxInclusive` restriction)|
|`BIGINT`                     |`integer` or subtype (may be with `minInclusive` and `maxInclusive` restriction)|
|`FLOAT`                      |`float` or `double` (may be with restriction)                                   |
|`REAL`                       |`float` or `double` (may be with restriction)                                   |
|`DOUBLE`                     |`float` or `double` (may be with restriction)                                   |
|`CHARACTER`                  |`string` with `length` restriction                                              |
|`CHARACTER VARYING`          |`string` with `maxLength` restriction                                           |
|`CHARACTER LARGE OBJECT`     |`string`(may be with `maxLength` restriction)                                   |
|`BINARY`                     |`hexBinary` with `length` restriction                                           |
|`BINARY VARYING`             |`hexBinary` with `maxLength` restriction                                        |
|`BINARY LARGE OBJECT`        |`hexBinary`(may be with `maxLength` restriction                                 |
|`BOOLEAN`                    |`boolean`                                                                       |
|`DATE`                       |`date`                                                                          |
|`TIME WITHOUT TIME ZONE`     |`time` with `pattern=.*[^+-].{4}[^Zz]` restriction                              |
|`TIME WITH TIME ZONE`        |`time` with `pattern=.*([Zz]\|[+-][0-9]{2}:[0-9]{2})` restriction               |
|`TIMESTAMP WITHOUT TIME ZONE`|`dateTime` with `pattern=.*[^+-].{4}[^Zz]` restriction                          |
|`TIMESTAMP WITH TIME ZONE`   |`dateTime` with `pattern=.*([Zz]\|[+-][0-9]{2}:[0-9]{2})` restriction           |
|`INTERVAL`                   |`duration`                                                                      |
|*Non-standard type*          |`anyType`                                                                       |

#### Constraints

|Constraint in SQL                 |Constraint representation in XML Schema            |
|----------------------------------|---------------------------------------------------|
|`PRIMARY KEY`(on a single column) |Add `key` element in `rows` element                |
|`PRIMARY KEY`(on multiple columns)|Not supported                                      |
|`UNIQUE`(on a single column)      |Add `unique` element in `rows` element             |
|`UNIQUE`(on multiple columns)     |Not supported                                      |
|`NOT NULL`                        |-                                                  |
|*(nullable)*                      |Add `minOccurs="0"` and `nillable="true"` attribute|
|`CHECK`                           |Not supported                                      |

### JSON Schema (preview)

#### Notice

JSON Schema is now being drafted.

This project currently uses draft 2019-09.

#### Types

|Type in SQL                  |Type representation in JSON Schema                                                                |
|-----------------------------|--------------------------------------------------------------------------------------------------|
|`NUMERIC`                    |`string` with `pattern` restriction.(*1)                                                          |
|`DECIMAL`                    |`string` with `pattern` restriction.(*1)                                                          |
|`SMALLINT`                   |`integer` with `minimum` and `maximum` restriction                                                |
|`INTEGER`                    |`integer` with `minimum` and `maximum` restriction                                                |
|`BIGINT`                     |`integer` with `minimum` and `maximum` restriction                                                |
|`FLOAT`                      |`number` with `minimum` and `maximum` restriction                                                 |
|`REAL`                       |`number` with `minimum` and `maximum` restriction                                                 |
|`DOUBLE`                     |`number` with `minimum` and `maximum` restriction                                                 |
|`CHARACTER`                  |`string` with `minLength` and `maxLength` restriction                                             |
|`CHARACTER VARYING`          |`string` with `maxLength` restriction                                                             |
|`CHARACTER LARGE OBJECT`     |`string`(may be with `maxLength` restriction)                                                     |
|`BINARY`                     |`string` with `pattern=^(?:[0-9a-fA-F]{2})*$`, `minLength` and `maxLength` restriction            |
|`BINARY VARYING`             |`string` with `pattern=^(?:[0-9a-fA-F]{2})*$` and `maxLength` restriction                         |
|`BINARY LARGE OBJECT`        |`string` with `pattern=^(?:[0-9a-fA-F]{2})*$` restriction(may be with `maxLength` restriction)    |
|`BOOLEAN`                    |`boolean`                                                                                         |
|`DATE`                       |`string` with `format=date` restriction                                                           |
|`TIME WITHOUT TIME ZONE`     |`string` with `format=time` and `pattern=^(?!.*([Zz]\|[+-][0-9]{2}:[0-9]{2})).*$` restriction     |
|`TIME WITH TIME ZONE`        |`string` with `format=time` and `pattern=(?:[Zz]\|[+-][0-9]{2}:[0-9]{2})$` restriction              |
|`TIMESTAMP WITHOUT TIME ZONE`|`string` with `format=date-time` and `pattern=^(?!.*([Zz]\|[+-][0-9]{2}:[0-9]{2})).*$` restriction|
|`TIMESTAMP WITH TIME ZONE`   |`string` with `format=date-time` and `pattern=(?:[Zz]\|[+-][0-9]{2}:[0-9]{2})$` restriction         |
|`INTERVAL`                   |`string` with `format=duration` restriction                                                       |
|*Non-standard type*          |*any type*                                                                                        |

*1 NUMERIC/DECIMAL pattern is follow the role below.
n := precision - scale
m := scale
1. precision/scale is undefined
`^-?(?:[0-9]+(?:\.[0-9]*)?|\.[0-9]+)$`
2. scale < 0
`^-?(?:0*[0-9]{1,n}(?:\.0*)?|\.0+)$`
3. precision = scale < 0
`^-?(?:0+(?:\.[0-9]{0,m}0*)?|\.[0-9]{1,m}0*)$`
4. else
`^-?(?:0*[0-9]{1,n}(?:\.[0-9]{0,m}0*)?|\.[0-9]{1,m}0*)$`


#### Constraints

|Constraint in SQL|Constraint representation in XML Schema|
|-----------------|---------------------------------------|
|`PRIMARY KEY`    |Not supported                          |
|`UNIQUE`         |Not supported                          |
|`NOT NULL`       |Add a column into `required` property  |
|*(nullable)*     |Add "null" type into `type` property   |
|`CHECK`          |Not supported                          |
