library(tidyverse)
library(ggkanlev)

set.seed(42)


##### Define `ggplot` Objects for Examples -----
scale_x_percent <- function(percent.accuracy = 1, axis.limits = c(NA, NA)) {
  ggplot2::scale_x_continuous(
    labels = scales::percent_format(accuracy = percent.accuracy),
    limits = axis.limits
  )
}


scale_y_percent <- function(percent.accuracy = 1, axis.limits = c(NA, NA)) {
  ggplot2::scale_y_continuous(
    labels = scales::percent_format(accuracy = percent.accuracy),
    limits = axis.limits
  )
}


scale_x_date <- function(date.breaks = "4 month", date.labels = "%b %y'") {
  ggplot2::scale_x_date(date_breaks = date.breaks, date_labels = date.labels)
}


ggsave_kanlev_examples <- function(plot, filename) {
  ggplot2::ggsave(
    filename = filename, plot = plot, device = png(),
    width = 4, height = 4, units = "in", dpi = 320
  )
}


##### Define Data Sources & Base Visual Examples -----
generate_figure_01 <- function(n = 1e5) {
  tibble::tibble(
    Control = stats::rbeta(n, 84, 986),
    `Variant A` = stats::rbeta(n, 96, 894),
    `Variant B` = stats::rbeta(n, 69, 889),
    period = sample(c("Pre", "Post"), n, replace = TRUE),
  ) %>%
    dplyr::mutate(
      `Variant A` = dplyr::if_else(period == "Pre", stats::rbeta(n(), 84, 986), `Variant A`),
      `Variant A` = (`Variant A` - Control) / Control,
      `Variant B` = (`Variant B` - Control) / Control,
      period = factor(period, levels = c("Pre", "Post")),
    ) %>%
    dplyr::select(`Variant A`, `Variant B`, period) %>%
    tidyr::gather(group, value, -period) %>%
    dplyr::filter(abs(value) <= 0.75) %>%
    ggplot2::ggplot(aes(x = value, fill = group, color = group)) +
    ggplot2::facet_grid(group~period) +
    ggplot2::geom_density(adjust = 5, alpha = 0.6) +
    ggplot2::geom_vline(xintercept = 0, color = scales::hue_pal()(5)[5], linetype = "dashed") +
    ggplot2::geom_vline(xintercept = c(-0.05, 0.05), color = scales::hue_pal()(4)[4], linetype = "longdash") +
    scale_x_percent(axis.limits = c(-0.75, 0.75)) +
    ggplot2::labs(
      title = "Bayesian Experimental Results",
      subtitle = "(Conversion Rate Posteriors)",
      x = "(Var - Ctl) / Ctl", y = "Density"
    )
}


generate_figure_02 <- function(n = 1e5) {
  tibble::tibble(
    male = stats::rnorm(n, 5 * 12 + 8, 3),
    female = stats::rnorm(n, 5 * 12 + 6, 3),
  ) %>%
    tidyr::gather(group, length) %>%
    dplyr::mutate(
      weight = dplyr::if_else(
        group == "male",
        stats::rnorm(n(), length * 2.071429, 6) + stats::runif(n(), -10, 40),
        stats::rnorm(n(), length * 2.142857, 5) + 30 - stats::rgamma(n(), 1, 30),
      ),
      length = dplyr::if_else(
        group == "male",
        length + stats::rgamma(n(), 1, 30) / 5,
        length + stats::rgamma(n(), 1, 30) / 20,
      ),
      length = round(pmin(pmax(length / 12, 4.5 + 1e-4), 6.5 - 1e-4), 5),
      weight = round(pmin(pmax(weight, 100 + 1e-4), 225 - 1e-4), 5),
    ) %>%
    ggplot2::ggplot(aes(x = length, y = weight, color = group)) +
    ggplot2::geom_point(shape = ".", alpha = 0.4, position = ggplot2::position_jitter()) +
    ggplot2::geom_smooth(method = "lm", se = FALSE, formula = y ~ x) +
    ggplot2::scale_x_continuous(limits = c(4.5, 6.5)) +
    ggplot2::scale_y_continuous(limits = c(100, 225)) +
    ggplot2::labs(
      title = "Adult Male and Female Catfish Measurements",
      subtitle = "(Note: Data is made up and not accurate)",
      x = "Length (ft)", y = "Weight (lbs)"
    )
}


generate_figure_03 <- function(n = 5e2, t = 365 * 2) {
  tibble::tibble(date = rep(lubridate::ymd("2019-01-01"), t) + seq(1, t) - 1) %>%
    dplyr::bind_cols(data.frame(rbind(rep(0, n), matrix(stats::rnorm(n = n * (t - 1), sd = 1e-2), t - 1, n)))) %>%
    dplyr::mutate_if(is.numeric, cumsum) %>%
    tidyr::gather(sample, value, -date) %>%
    dplyr::mutate(value = pmin(pmax(value, -1), 1)) %>%
    ggplot2::ggplot(aes(x = date, y = value, group = sample)) +
    ggplot2::geom_line(alpha = 0.20, color = scales::hue_pal()(1)) +
    scale_x_date(date.breaks = "4 month", date.labels = "%b %y'") +
    scale_y_percent(axis.limits = c(-1, 1)) +
    ggplot2::labs(
      title = "Porfolio Invement Return",
      subtitle = glue::glue("(Simulation of {n} Scenarios)"),
      x = "Date", y = "Return Rate"
    )
}


##### Generating & Save Visual Examples -----
examples <- list(
  "fig01" = generate_figure_01(n = 1e6),
  "fig02" = generate_figure_02(n = 1e4),
  "fig03" = generate_figure_03(n = 1e2)
)

themes <- list(
  "light" = ggkanlev::theme_kanlev_light,
  "dark" = ggkanlev::theme_kanlev_dark,
  "coffee" = ggkanlev::theme_kanlev_coffee,
  "white" = ggkanlev::theme_kanlev_white,
  "black" = ggkanlev::theme_kanlev_black
)


for (name in names(examples)) {
  for (theme in names(themes)) {
    ggsave_kanlev_examples(
      examples[[name]] + themes[[theme]](size.font = 4),
      glue::glue("{name}-{theme}.png")
    )
  }
}
