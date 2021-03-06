# PHE_NASSS_Cardiac
Extracting and tidying up data from graphs in the National Ambulance Syndromic Surveillance System (England)

I extracted Cardiac/Respiratory Arrest data from graphs in five publications from the UK Health Security Agency/Public Health England bulletins on the NASSS.
The five publications were:

https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/860059/NASS_Bulletin_2020_03.pdf

![2020 Ambulance bulletin - cardiac](https://user-images.githubusercontent.com/82215025/152960810-58142619-45ba-41fd-b367-b6cc2e08cb79.png)

https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/871917/NASS_Bulletin_2020_10.pdf

![2020 Ambulance bulletin (week 10) - cardiac](https://user-images.githubusercontent.com/82215025/154716501-b31ddfe0-72cc-41ab-8c10-c75c50262cb9.png)

https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/954014/NASS_Bulletin_2021_02.pdf

![2021 Ambulance bulletin - cardiac](https://user-images.githubusercontent.com/82215025/152960850-46ec26b4-e659-4d33-ab98-0dc32be417f5.png)

https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/966198/NASS_Bulletin_2021_08.pdf

![2021 Ambulance bulletin (week 08) - cardiac](https://user-images.githubusercontent.com/82215025/154716791-53a1569b-601f-4774-97c1-48b5cf25ad12.png)

https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1050383/UKHSA_NASS_Bulletin_2022_03.pdf

![2022 Ambulance bulletin - cardiac](https://user-images.githubusercontent.com/82215025/152960899-8edd466f-1125-4a2c-a7bb-66164ef89cd7.png)

## How the graphs were processed
The copied graphs were uploaded into WebPlotDigitizer (https://automeris.io/WebPlotDigitizer/) after some mild modification with GIMP (https://www.gimp.org) to remove  gridlines and the daily data trace.

This graph shows all the data from the four reports plotted together.
![2022-02-21 NASSS Cardiac Calls (reduced y range)](https://user-images.githubusercontent.com/82215025/155010287-d83bdd75-193d-4acd-b189-29eac38d9775.png)

This graph shows which data from each report was used. It also shows interpolated points (in grey) used to fill the gaps between datapoints read using WebPlotDigitizer.

![2022-02-21 NASSS Cardiac Calls (points)](https://user-images.githubusercontent.com/82215025/155010432-ad1f6da3-2b2a-4aa4-b5dd-dd225f0bf443.png)

Data was saved as .csv files then tidied in R (https://cran.r-project.org/) to remove duplicates and combine the datasets.
Simple graphs were made using ggplot2 (https://ggplot2.tidyverse.org).

## Licence
The data and reports shared here are available under the Open Government Licence (https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)

## Acknowledgements
The graph style with lines showing where each year starts and ends, and labels for each year, was developed using example code from http://www.jasonfabris.com/blog/dteformat/
