from banco import conectar

def listar_produtos():
    conexao = conectar()
    cursor = conexao.cursor()

    cursor.execute("SELECT * FROM produtos")

    produtos = cursor.fetchall()

    print("\n=== PRODUTOS CADASTRADOS ===")

    for produto in produtos:
        print(produto)

    cursor.close()
    conexao.close()


listar_produtos()
