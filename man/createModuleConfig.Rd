% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CreateConfig.R
\name{createModuleConfig}
\alias{createModuleConfig}
\title{createModuleConfig}
\usage{
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
}
\arguments{
\item{moduleId}{The shiny id for the tab containing the module UI}

\item{tabName}{The name of the tab in the shiny app (this will be the side menu button text)}

\item{shinyModulePackage}{The R package to find the server and UI functions}

\item{shinyModulePackageVersion}{The minimum version of the shinyModulePackage}

\item{moduleUiFunction}{The name of the UI function in the R package shinyModulePackage}

\item{moduleServerFunction}{The name of the server function in the R package shinyModulePackage}

\item{moduleInfoBoxFile}{The function in the R package shinyModulePackage that contains info text}

\item{moduleIcon}{The icon to use for the side menu button}

\item{installSource}{Either CRAN or github specifying where to install shinyModulePackage from}

\item{gitHubRepo}{If installSource is github then this is the github repo containing the package e.g., 'ohdsi'}
}
\value{
An R list with the module config settings
}
\description{
Create an R list with the config specification
}
\details{
User specifies the settings to create a config for a module
}
\seealso{
Other ModuleConfig: 
\code{\link{createDefaultAboutConfig}()},
\code{\link{createDefaultCharacterizationConfig}()},
\code{\link{createDefaultCohortDiagnosticsConfig}()},
\code{\link{createDefaultCohortGeneratorConfig}()},
\code{\link{createDefaultCohortMethodConfig}()},
\code{\link{createDefaultDatasourcesConfig}()},
\code{\link{createDefaultEstimationConfig}()},
\code{\link{createDefaultEvidenceSynthesisConfig}()},
\code{\link{createDefaultHomeConfig}()},
\code{\link{createDefaultPhevaluatorConfig}()},
\code{\link{createDefaultPredictionConfig}()},
\code{\link{createDefaultReportConfig}()},
\code{\link{createDefaultSccsConfig}()}
}
\concept{ModuleConfig}
