# ggkanlev | [![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

Personal themes, scales, palettes, and helpers for [ggplot2](https://ggplot2.tidyverse.org). Package
inspired by [ggthemes](https://github.com/jrnold/ggthemes), including usage of `ggthemes::theme_foundation`
for `ggkanlev::theme_kanlev_base`.


## Installation
Package is only available on GitHub. To install use `devtools` as follows:

```r devtools::install_github("levikanwischer/ggkanlev")```


## Usage
Themes can be set at the global level (`ggplot2::set_theme(ggkanlev::theme_kanlev_light())`) or
applied directly (`p + ggkanlev::theme_kanlev_light()` where `p` is a `ggplot2` object).


## Themes
<table>
 <tr>
    <td>
        <img src="figures/fig01-light.png" title="Figure 01 (theme_kanlev_light)">
        <img src="figures/fig01-dark.png" title="Figure 01 (theme_kanlev_dark)">
        <img src="figures/fig01-coffee.png" title="Figure 01 (theme_kanlev_coffee)">
        <img src="figures/fig01-white.png" title="Figure 01 (theme_kanlev_white)">
        <img src="figures/fig01-black.png" title="Figure 01 (theme_kanlev_black)">
    </td>
    <td>
        <img src="figures/fig02-light.png" title="Figure 02 (theme_kanlev_light)">
        <img src="figures/fig02-dark.png" title="Figure 02 (theme_kanlev_dark)">
        <img src="figures/fig02-coffee.png" title="Figure 02 (theme_kanlev_coffee)">
        <img src="figures/fig02-white.png" title="Figure 02 (theme_kanlev_white)">
        <img src="figures/fig02-black.png" title="Figure 02 (theme_kanlev_black)">
   </td>
    <td>
        <img src="figures/fig03-light.png" title="Figure 03 (theme_kanlev_light)">
        <img src="figures/fig03-dark.png" title="Figure 03 (theme_kanlev_dark)">
        <img src="figures/fig03-coffee.png" title="Figure 03 (theme_kanlev_coffee)">
        <img src="figures/fig03-white.png" title="Figure 03 (theme_kanlev_white)">
        <img src="figures/fig03-black.png" title="Figure 03 (theme_kanlev_black)">
   </td>
 </tr>
</table>
