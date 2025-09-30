import streamlit as st
import pandas as pd

st.title("🛠️ Editor de DataFrame (.pkl)")

# Cargar archivo
df = pd.read_pickle("tabla_maestra.pkl")
st.dataframe(df)

# Ejemplo simple de edición:
columna = st.selectbox("Seleccionar columna para modificar", df.columns)
indice = st.number_input("Fila (index)", min_value=0, max_value=len(df)-1, step=1)
nuevo_valor = st.text_input("Nuevo valor")

if st.button("Modificar"):
    df.at[indice, columna] = nuevo_valor
    st.success(f"Fila {indice} columna '{columna}' modificada!")
    st.dataframe(df)

# Guardar cambios
if st.button("💾 Guardar cambios"):
    df.to_pickle("tabla_maestra - copia.pkl")
    st.success("Archivo guardado correctamente!")
