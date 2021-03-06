% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme.R
\name{theme_kanlev_base}
\alias{theme_kanlev_base}
\title{Base Package Theme}
\usage{
theme_kanlev_base(color.background, color.font, size.font)
}
\arguments{
\item{color.background}{Background color of plot. String of valid color/code.}

\item{color.font}{Font color of plot. String of valid color/code.}

\item{size.font}{Size of base font in plot. Integer between \code{4} and \code{16}.}
}
\value{
\code{\link[ggplot2]{theme}()} object with custom settings.
}
\description{
This theme is primarily meant for internal use as a core base for other
package themes. It inherits from \code{\link[ggthemes]{theme_foundation}()},
which is a stripped down version of \code{\link[ggplot2]{theme_grey}()}. At
the themes heart is minimal to zero scaffolding in favor of making data the
core emphasis. Most objects are set to NULL or NA at the top level, which
should make further customization simple as different needs arise.
}
\examples{
ggplot2::ggplot(data.frame(x = stats::rnorm(1e2), y = stats::rnorm(1e2))) +
  ggplot2::geom_point(ggplot2::aes(x = x, y = y)) +
  ggkanlev::theme_kanlev_base("white", "black", 8)

}
\seealso{
Other themes: 
\code{\link{theme_kanlev_black}()},
\code{\link{theme_kanlev_coffee}()},
\code{\link{theme_kanlev_dark}()},
\code{\link{theme_kanlev_light}()},
\code{\link{theme_kanlev_white}()}
}
\concept{themes}
