# createDefaultResultDatabaseSettings

Create an R list with the default table prefixes and tables

## Usage

``` r
createDefaultResultDatabaseSettings(
  schema = "main",
  vocabularyDatabaseSchema = schema,
  cgTablePrefix = "cg_",
  cgTable = "cohort_definition",
  databaseTable = "DATABASE_META_DATA",
  databaseTablePrefix = "",
  cdTablePrefix = "cd_",
  cTablePrefix = "c_",
  incidenceTablePrefix = "ci_",
  plpTablePrefix = "plp_",
  cmTablePrefix = "cm_",
  sccsTablePrefix = "sccs_",
  esTablePrefix = "es_",
  pvTablePrefix = "pv_"
)
```

## Arguments

- schema:

  The schema containing the OHDSI study results

- vocabularyDatabaseSchema:

  The schema containing the vocabulary database

- cgTablePrefix:

  The table prefix for cohort generator tables

- cgTable:

  The table with the cohort definitions in cohort generator

- databaseTable:

  The table with the database details

- databaseTablePrefix:

  The prefix for the databaseTable

- cdTablePrefix:

  The table prefix for the cohort diagnostic results

- cTablePrefix:

  The table prefix for the characterization results

- incidenceTablePrefix:

  The table prefix for the incidence results

- plpTablePrefix:

  The table prefix for the prediction results

- cmTablePrefix:

  The table prefix for the cohort method results

- sccsTablePrefix:

  The table prefix for the self controlled case series results

- esTablePrefix:

  The table prefix for the evidence synthesis method results

- pvTablePrefix:

  The table prefix for the phevaluator results

## Value

An R list with the module config settings

## Details

User specifies the schema name and can override default table prefixes
and table names
