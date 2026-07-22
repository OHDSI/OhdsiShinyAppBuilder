# createModuleConfig

Create an R list with the config specification

## Usage

``` r
createModuleConfig(
  moduleId = "about",
  tabName = "About",
  shinyModulePackage = "OhdsiShinyModules",
  shinyModulePackageVersion = "3.0.0",
  moduleUiFunction = "aboutViewer",
  moduleServerFunction = "aboutServer",
  moduleInfoBoxFile = "aboutHelperFile()",
  moduleIcon = "info",
  installSource = "CRAN",
  gitHubRepo = NULL
)
```

## Arguments

- moduleId:

  The shiny id for the tab containing the module UI

- tabName:

  The name of the tab in the shiny app (this will be the side menu
  button text)

- shinyModulePackage:

  The R package to find the server and UI functions

- shinyModulePackageVersion:

  The minimum version of the shinyModulePackage

- moduleUiFunction:

  The name of the UI function in the R package shinyModulePackage

- moduleServerFunction:

  The name of the server function in the R package shinyModulePackage

- moduleInfoBoxFile:

  The function in the R package shinyModulePackage that contains info
  text

- moduleIcon:

  The icon to use for the side menu button

- installSource:

  Either CRAN or github specifying where to install shinyModulePackage
  from

- gitHubRepo:

  If installSource is github then this is the github repo containing the
  package e.g., 'ohdsi'

## Value

An R list with the module config settings

## Details

User specifies the settings to create a config for a module

## See also

Other ModuleConfig:
[`createDefaultAboutConfig()`](createDefaultAboutConfig.md),
[`createDefaultCharacterizationConfig()`](createDefaultCharacterizationConfig.md),
[`createDefaultCohortDiagnosticsConfig()`](createDefaultCohortDiagnosticsConfig.md),
[`createDefaultCohortGeneratorConfig()`](createDefaultCohortGeneratorConfig.md),
[`createDefaultCohortMethodConfig()`](createDefaultCohortMethodConfig.md),
[`createDefaultDatasourcesConfig()`](createDefaultDatasourcesConfig.md),
[`createDefaultEstimationConfig()`](createDefaultEstimationConfig.md),
[`createDefaultEvidenceSynthesisConfig()`](createDefaultEvidenceSynthesisConfig.md),
[`createDefaultHomeConfig()`](createDefaultHomeConfig.md),
[`createDefaultPhevaluatorConfig()`](createDefaultPhevaluatorConfig.md),
[`createDefaultPredictionConfig()`](createDefaultPredictionConfig.md),
[`createDefaultReportConfig()`](createDefaultReportConfig.md),
[`createDefaultSccsConfig()`](createDefaultSccsConfig.md)
