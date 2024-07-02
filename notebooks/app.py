# This file generated by Quarto; do not edit by hand.
# shiny_mode: core

from __future__ import annotations

from pathlib import Path
from shiny import App, Inputs, Outputs, Session, ui




def server(input: Inputs, output: Outputs, session: Session) -> None:
    import plotly.express as px
    import matplotlib.pyplot as plt
    import pandas as pd 
    import numpy as np 

    # for price API
    from urllib.request import urlopen
    import certifi
    import json

    # Shiny
    from shiny import App, ui, render
    import shinywidgets
    import mpld3

    # ========================================================================

    fmp_api_key = pd.read_table(r'../../FMP_api_key')
    fmp_api_key = fmp_api_key['key'][0]

    # ========================================================================

    def get_jsonparsed_data(url):
        response = urlopen(url, cafile=certifi.where())
        data = response.read().decode("utf-8")
        return json.loads(data)

    url = ("https://financialmodelingprep.com/api/v3/quote/KEUSX?apikey="+fmp_api_key)

    # ========================================================================

    keusx_dict = get_jsonparsed_data(url)

    keusx_price = keusx_dict[0]['price']

    # ========================================================================

    # WTO DATA

    # Read tables 
    WTO_members = pd.read_csv(r'../data/WTO_members.csv')
    WTO_observers = pd.read_csv(r'../data/WTO_observers.csv')

    # Drop first rows
    WTO_members.drop(WTO_members.iloc[0,].name, inplace=True)
    WTO_observers.drop(WTO_observers.iloc[0,].name, inplace=True)

    # Add columns 
    WTO_observers['Status'] = 'Observer'
    WTO_members['Status'] = 'Member'

    # Reset indices
    WTO_observers = WTO_observers.reset_index(drop=True)
    WTO_members = WTO_members.reset_index(drop=True)

    # Zip concatenated columns for members and observers to dictionary
    WTO_dict = dict(zip(pd.concat([WTO_members['State'],WTO_observers['State']]),pd.concat([WTO_members['Status'],WTO_observers['Status']])))

    # ========================================================================

    # Top10 loading

    top_10 = pd.read_csv(r'../data/Wheat_production_FAO.csv')
    top_10 = top_10[['Area','Year','Value']]

    # clean names
    top_10['Area'][0] = "China"
    top_10['Area'][2] = "Russia"
    top_10['Area'][3] = "United States"

    # ========================================================================

    dict(value = keusx_price)

    # ========================================================================

    # dict(value = keusx_price)
    print("5th")

    # ========================================================================

    dict(value = WTO_dict['Australia'])

    # ========================================================================

    dict(value = keusx_price)

    # ========================================================================

    container_df = pd.DataFrame(pd.read_csv(r'../data/container_port_traffic/API_IS.SHP.GOOD.TU_DS2_en_csv_v2_444204.csv', sep=","))

    countries = top_10['Area']
    container_2021 = []
    for country in countries:
        i = container_df[container_df['Country Name']==country].index
        container_2021.append(str(container_df.loc[i, '2021']).split()[1])
    container_2021[2] = 'NaN'
    df_countries_totals = pd.DataFrame({'Country': countries, 'Total 2021': container_2021})

    # ========================================================================

    country_totals_dict = dict(zip(countries, container_2021))
    # country_totals_dict

    # ========================================================================

    dict(value = country_totals_dict['Australia'])

    # ========================================================================

    ## Row {height=20%}

    # ========================================================================

    ### {.sidebar}

    # ========================================================================

    # from shiny.express import render, ui, input
    # from shinywidgets import render_plotly
    # ui.input_checkbox_group(  
    #     "checkbox_group",  
    #     "Index name",  
    #     {  
    #         "a": "United States of America (Gulf), Wheat (US No. 2, Hard Red Winter)",  
    #         "b": "Argentina, Wheat (12%, Up River)",  
    #         "c": "Australia (Eastern States), Wheat (ASW)",
    #         "d": "Canada (St Lawrence), Wheat (CWRS, 13.5%)",
    #         "e": "European Union (France), Wheat (grade 1, Rouen)",
    #         "f": "United States of America (Gulf), Wheat (US No. 2, Soft Red Winter"
    #     },  
    # )  

    # @render.text
    # def value():
    #     return ", ".join(input.checkbox_group())

    # ========================================================================

    # @render_plotly
    # def lineplot():
    #     fig = px.line(resorted_wp, x = 'Date', y = 'Price', color = 'Country_Wheat_Type', title = 'Historic wheat prices')
    #     # fig.update_layout(legend=dict(
    #     #     orientation="v",
    #     #     yanchor="bottom",
    #     #     y=0.5,
    #     #     xanchor="right",
    #     #     x=10,
    #     #     title_font_family="Courier",
    #     #         font=dict(
    #     #             family="Courier",
    #     #             size=14,
    #     #             color="black"
    #     #         ),
    #     # ))
    #     # return fig

    # ========================================================================

    wheat_prices = pd.read_csv(r'../data/wheat_prices_FAO.csv')

    wheat_prices.columns = ['Date','United States of America (Gulf), Wheat (US No. 2, Hard Red Winter)',
    'Argentina, Wheat (12%, Up River)',
    'Australia (Eastern States), Wheat (ASW)',
    'Canada (St Lawrence), Wheat (CWRS, 13.5%)',
    'European Union (France), Wheat (grade 1, Rouen)',
    'United States of America (Gulf), Wheat (US No. 2, Soft Red Winter)']

    long_format_wp = pd.melt(wheat_prices, id_vars=['Date'], 
                             var_name='Country_Wheat_Type', 
                             value_name='Price')

    sorted_wp = long_format_wp.sort_values(by = 'Date', ascending=False).reset_index(drop=True)

    sorted_wp['Date'] = (pd.to_datetime(sorted_wp['Date'])).dt.date

    resorted_wp = sorted_wp.sort_values(by='Date', ascending=False).reset_index(drop=True)



    # ========================================================================

    fig = px.line(resorted_wp, x = 'Date', y = 'Price', color = 'Country_Wheat_Type', title = 'Historic wheat prices')

    fig = fig.update_layout(legend=dict(
            orientation="v",
            yanchor="bottom",
            y=0.5,
            xanchor="right",
            x=10,
            title_font_family="Courier",
                font=dict(
                    family="Courier",
                    size=14,
                    color="black"
                ),
        ))
    fig.show(renderer = "notebook")

    # ========================================================================



    return None


_static_assets = ["Quarto_dash_files","Quarto_dash_files\\figure-html\\6a60e99d-6edc-42a4-89eb-c62a1fc17f8b-1-99eebaf5-78ef-4113-9a09-05c91e9c4630.svg","Quarto_dash_files\\figure-html\\700f7008-4ff6-4790-9d91-03653d8341b0-1-ca19cc92-0408-4697-a8a8-619a5c8fd08e.jpg","Quarto_dash_files\\libs\\quarto-html\\tippy.css","Quarto_dash_files\\libs\\quarto-html\\quarto-syntax-highlighting.css","Quarto_dash_files\\libs\\bootstrap\\bootstrap-icons.css","Quarto_dash_files\\libs\\bootstrap\\bootstrap.min.css","Quarto_dash_files\\libs\\quarto-dashboard\\datatables.min.css","Quarto_dash_files\\libs\\clipboard\\clipboard.min.js","Quarto_dash_files\\libs\\quarto-html\\quarto.js","Quarto_dash_files\\libs\\quarto-html\\popper.min.js","Quarto_dash_files\\libs\\quarto-html\\tippy.umd.min.js","Quarto_dash_files\\libs\\quarto-html\\anchor.min.js","Quarto_dash_files\\libs\\bootstrap\\bootstrap.min.js","Quarto_dash_files\\libs\\quarto-dashboard\\quarto-dashboard.js","Quarto_dash_files\\libs\\quarto-dashboard\\stickythead.js","Quarto_dash_files\\libs\\quarto-dashboard\\datatables.min.js","Quarto_dash_files\\libs\\quarto-dashboard\\pdfmake.min.js","Quarto_dash_files\\libs\\quarto-dashboard\\vfs_fonts.js","Quarto_dash_files\\libs\\quarto-dashboard\\web-components.js","Quarto_dash_files\\libs\\quarto-dashboard\\components.js"]
_static_assets = {"/" + sa: Path(__file__).parent / sa for sa in _static_assets}

app = App(
    Path(__file__).parent / "Quarto_dash.html",
    server,
    static_assets=_static_assets,
)