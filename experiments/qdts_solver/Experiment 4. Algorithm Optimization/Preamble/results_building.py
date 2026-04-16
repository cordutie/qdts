import pandas as pd

def results_to_excel(lista,nombre):
    df = pd.DataFrame(lista)
    writer = pd.ExcelWriter(nombre, engine='xlsxwriter')
    df.to_excel(writer, index=False)
    writer.close()

