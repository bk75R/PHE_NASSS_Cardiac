# PHE_NASSS_Cardiac
Extracting and tidying up data from graphs in the National Ambulance Syndromic Surveillance System (England)

I extracted Cardiac/Respiratory Arrest data from graphs in five publications from the UK Health Security Agency/Public Health England bulletins on the NASSS.
The five publications were:

https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/860059/NASS_Bulletin_2020_03.pdf

https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/871917/NASS_Bulletin_2020_10.pdf

![2020 Ambulance bulletin - cardiac](https://user-images.githubusercontent.com/82215025/152960810-58142619-45ba-41fd-b367-b6cc2e08cb79.png)

https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/954014/NASS_Bulletin_2021_02.pdf

https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/871917/NASS_Bulletin_2020_10.pdf

![2021 Ambulance bulletin - cardiac](https://user-images.githubusercontent.com/82215025/152960850-46ec26b4-e659-4d33-ab98-0dc32be417f5.png)

https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1050383/UKHSA_NASS_Bulletin_2022_03.pdf

![2022 Ambulance bulletin - cardiac](https://user-images.githubusercontent.com/82215025/152960899-8edd466f-1125-4a2c-a7bb-66164ef89cd7.png)

## How the graphs were processed
The copied graphs were uploaded into WebPlotDigitizer (https://automeris.io/WebPlotDigitizer/) after some mild modification with GIMP (https://www.gimp.org) to remove  gridlines and the daily data trace.

Data was saved as .csv files then tidied in R (https://cran.r-project.org/) to remove duplicates and combine the datasets.
Simple graphs were made using ggplot2 (https://ggplot2.tidyverse.org).

![2022-02-05 NASSS Cardiac Calls (reduced y range)](https://user-images.githubusercontent.com/82215025/152962172-9dcc230b-cb94-4eb3-ad48-dd210b850f13.png)

## Licence
The data shared here is available under the Open Government Licence (https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)
