
<!-- README.md is generated from README.Rmd. Please edit that file -->

# flipr

<!-- badges: start -->
<!-- badges: end -->

The goal of flipr is to flip the rows and columns of a data frame.
Included is an example dataset.

## Installation

You can install the released version of flipr from
[Github](https://github.com) with:

``` r
devtools::install_github("fieldima/flipr", ref = "0.1.0")
```

    ## Example

    This is a basic example of when you would use flipr:


    ```r
    library(flipr)

    #Packaged with flipr is a set of simulation data that needs to be flipped.
    sim <- simulation_data

    #Can either return as a data frame or a tibble
    flip(sim)
    #>       m.sig     c.var      s.var      s.asr     s.hgt     d.cdf
    #> 1 0.9290709 0.1758242 0.89110889 0.57742258 0.3716284 0.8831169
    #> 2 0.9450549 0.7552448 0.35564436 0.08791209 0.3956044 0.8711289
    #> 3 0.8791209 0.9210789 0.43356643 0.63936064 0.4695305 0.9790210
    #> 4 0.9050949 0.8991009 0.02797203 0.48551449 0.5794206 0.8911089
    #> 5 0.9330669 0.5694306 0.81318681 0.55744256 0.9470529 0.8491508
    flip(sim, TRUE)
    #> # A tibble: 5 x 6
    #>   m.sig c.var  s.var  s.asr s.hgt d.cdf
    #>   <dbl> <dbl>  <dbl>  <dbl> <dbl> <dbl>
    #> 1 0.929 0.176 0.891  0.577  0.372 0.883
    #> 2 0.945 0.755 0.356  0.0879 0.396 0.871
    #> 3 0.879 0.921 0.434  0.639  0.470 0.979
    #> 4 0.905 0.899 0.0280 0.486  0.579 0.891
    #> 5 0.933 0.569 0.813  0.557  0.947 0.849
