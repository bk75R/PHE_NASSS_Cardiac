# PHE_NASSS_Cardiac
Extracting and tidying up data from graphs in the National Ambulance Syndromic Surveillance System (England)

I extracted Cardiac/Respiratory Arrest data from graphs in three publications from the UK Health Security Agency/Public Health England bulletins on the NASSS.
The three publications were:

https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/860059/NASS_Bulletin_2020_03.pdf
https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/954014/NASS_Bulletin_2021_02.pdf
https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1050383/UKHSA_NASS_Bulletin_2022_03.pdf

## How the graphs were processed
The copied graphs were uploaded into WebPlotDigitizer (https://automeris.io/WebPlotDigitizer/) after some mild modification with GIMP (https://www.gimp.org) to remove  gridlines and the daily data trace.

Data was saved as .csv files then tidied in R (https://cran.r-project.org/) to remove duplicates and combine the datasets.
Simple graphs were made using ggplot2 (https://ggplot2.tidyverse.org).

## Licence
The data shared here is available under the Open Government Licence (https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)
