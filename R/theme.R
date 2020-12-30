#' Base Package Theme
#'
#' @description
#' This theme is primarily meant for internal use as a core base for other
#' package themes. It inherits from \code{\link[ggthemes]{theme_foundation}()},
#' which is a stripped down version of \code{\link[ggplot2]{theme_grey}()}. At
#' the themes heart is minimal to zero scaffolding in favor of making data the
#' core emphasis. Most objects are set to NULL or NA at the top level, which
#' should make further customization simple as different needs arise.
#'
#' @family themes
#'
#' @param color.background Background color of plot. String of valid color/code.
#' @param color.font Font color of plot. String of valid color/code.
#' @param size.font Size of base font in plot. Integer between \code{4} and \code{16}.
#'
#' @return \code{\link[ggplot2]{theme}()} object with custom settings.
#'
#' @importFrom assertthat assert_that
#' @importFrom ggplot2 aes element_blank element_rect element_text geom_point ggplot theme
#' @importFrom ggthemes theme_foundation
#'
#' @examples
#' ggplot2::ggplot(data.frame(x = stats::rnorm(1e2), y = stats::rnorm(1e2))) +
#'   ggplot2::geom_point(ggplot2::aes(x = x, y = y)) +
#'   ggkanlev::theme_kanlev_base("white", "black", 8)
#'
#' @export
theme_kanlev_base <- function(color.background, color.font, size.font) {

  assertthat::assert_that(color.font != color.background)
  assertthat::assert_that(size.font >= 4 & size.font <= 16)

  ggthemes::theme_foundation() +
    ggplot2::theme(
      line = ggplot2::element_blank(),
      rect = ggplot2::element_rect(fill = color.background, colour = color.background),
      text = ggplot2::element_text(
        family = "mono", face = "plain", size = size.font,
        vjust = 0.5, hjust = 0.5,
        colour = color.font,
      ),
      title = ggplot2::element_text(size = size.font),
      plot.title = ggplot2::element_text(
        size = size.font + 3, vjust = 0.5, hjust = 0.5
      ),
      plot.subtitle = ggplot2::element_text(
        size = size.font + 1, vjust = 0.5, hjust = 0.5
      ),
      legend.title = ggplot2::element_blank(),
      legend.position = "bottom",
    )

}


#' Light Theme
#'
#' This theme uses a light grey (grey89) background with a dark grey (grey29)
#' font. All other settings are inherited from \code{theme_kanlev_base()},
#'
#' @family themes
#'
#' @seealso [theme_kanlev_base()]
#'
#' @param size.font Size of base font in plot. Integer between \code{4} and \code{16}.
#'
#' @return \code{\link[ggplot2]{theme}()} object with custom settings.
#'
#' @importFrom ggplot2 aes geom_point ggplot
#'
#' @examples
#' ggplot2::ggplot(data.frame(x = stats::rnorm(1e2), y = stats::rnorm(1e2))) +
#'   ggplot2::geom_point(ggplot2::aes(x = x, y = y)) +
#'   ggkanlev::theme_kanlev_light()
#'
#' @export
theme_kanlev_light <- function(size.font = 8) {
  theme_kanlev_base("grey89", "grey29", size.font)
}


#' Dark Theme
#'
#' This theme uses a dark grey (grey29) background with a light grey (grey89)
#' font. All other settings are inherited from \code{theme_kanlev_base()},
#'
#' @family themes
#'
#' @seealso [theme_kanlev_base()]
#'
#' @param size.font Size of base font in plot. Integer between \code{4} and \code{16}.
#'
#' @return \code{\link[ggplot2]{theme}()} object with custom settings.
#'
#' @importFrom ggplot2 aes geom_point ggplot
#'
#' @examples
#' ggplot2::ggplot(data.frame(x = stats::rnorm(1e2), y = stats::rnorm(1e2))) +
#'   ggplot2::geom_point(ggplot2::aes(x = x, y = y)) +
#'   ggkanlev::theme_kanlev_dark()
#'
#' @export
theme_kanlev_dark <- function(size.font = 8) {
  theme_kanlev_base("grey29", "grey89", size.font)
}


#' Coffee Theme
#'
#' This theme uses a light coffee (bisque) background with a dark coffee (bisque4)
#' font. All other settings are inherited from \code{theme_kanlev_base()},
#'
#' @family themes
#'
#' @seealso [theme_kanlev_base()]
#'
#' @param size.font Size of base font in plot. Integer between \code{4} and \code{16}.
#'
#' @return \code{\link[ggplot2]{theme}()} object with custom settings.
#'
#' @importFrom ggplot2 aes geom_point ggplot
#'
#' @examples
#' ggplot2::ggplot(data.frame(x = stats::rnorm(1e2), y = stats::rnorm(1e2))) +
#'   ggplot2::geom_point(ggplot2::aes(x = x, y = y)) +
#'   ggkanlev::theme_kanlev_coffee()
#'
#' @export
theme_kanlev_coffee <- function(size.font = 8) {
  theme_kanlev_base("bisque", "bisque4", size.font)
}


#' White Theme
#'
#' This theme uses a white background with a black font. All other settings
#' are inherited from \code{theme_kanlev_base()},
#'
#' @family themes
#'
#' @seealso [theme_kanlev_base()]
#'
#' @param size.font Size of base font in plot. Integer between \code{4} and \code{16}.
#'
#' @return \code{\link[ggplot2]{theme}()} object with custom settings.
#'
#' @importFrom ggplot2 aes geom_point ggplot
#'
#' @examples
#' ggplot2::ggplot(data.frame(x = stats::rnorm(1e2), y = stats::rnorm(1e2))) +
#'   ggplot2::geom_point(ggplot2::aes(x = x, y = y)) +
#'   ggkanlev::theme_kanlev_white()
#'
#' @export
theme_kanlev_white <- function(size.font = 8) {
  theme_kanlev_base("white", "black", size.font)
}


#' Black Theme
#'
#' This theme uses a black background with a white font. All other settings
#' are inherited from \code{theme_kanlev_base()},
#'
#' @family themes
#'
#' @seealso [theme_kanlev_base()]
#'
#' @param size.font Size of base font in plot. Integer between \code{4} and \code{16}.
#'
#' @return \code{\link[ggplot2]{theme}()} object with custom settings.
#'
#' @importFrom ggplot2 aes geom_point ggplot
#'
#' @examples
#' ggplot2::ggplot(data.frame(x = stats::rnorm(1e2), y = stats::rnorm(1e2))) +
#'   ggplot2::geom_point(ggplot2::aes(x = x, y = y)) +
#'   ggkanlev::theme_kanlev_black()
#'
#' @export
theme_kanlev_black <- function(size.font = 8) {
  theme_kanlev_base("black", "white", size.font)
}
