# viewShiny

Open the shiny app

## Usage

``` r
viewShiny(
  config,
  connection,
  resultDatabaseSettings = createDefaultResultDatabaseSettings(),
  connectionDetails = NULL,
  usePooledConnection = TRUE,
  studyDescription = NULL,
  title = "OHDSI Analysis Viewer",
  protocolLink = "http://ohdsi.org",
  themePackage = "OhdsiShinyAppBuilder",
  htmlHeader = ""
)
```

## Arguments

- config:

  The json with the app config

- connection:

  A connection to the results

- resultDatabaseSettings:

  A list with the result schema and table prefixes

- connectionDetails:

  A DatabaseConnector::connectionDetails connection to the results
  database

- usePooledConnection:

  Use a pooled database connection or not - set to true for multi-user
  environments (default)

- studyDescription:

  A human-readable character string describing the study/analysis

- title:

  The title for the app. Defaults to: OHDSI Analysis Viewer

- protocolLink:

  A link to a site containing the study protocol

- themePackage:

  A package containing custom theme elements

- htmlHeader:

  Additional HTML to add to the shiny app header

## Value

The shiny app will open

## Details

User specifies the json config and connection

## See also

Other Shiny: [`createShinyApp()`](createShinyApp.md)
