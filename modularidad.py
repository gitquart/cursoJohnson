"""
This example aims to show MODULARITY in python
Let's change this useful code into a Module so it can be used
better in more files. (LIVE PRACTICE)
"""

def saludar():
    print('Hola, soy un robot que te ayudará a presentarte...')
    print('¿Cuál es tu edad?\n')
    nombre=input()
    print('¿Qué te gusta hacer?')
    actividad=input()
    presentacion='Hola, me llamo '+nombre+' y me gusta '+actividad+'. Estoy programando en el curso\n'
    print('*****************************************')
    print(presentacion)
    print('****************************************')