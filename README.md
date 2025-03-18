# Banco de Dados Relacional - Academia Malha e Malha

Projeto proposto na cadeira de **Gerenciamento de Dados e Informação - IF685**, com o objetivo de aplicar conceitos de modelagem conceitual, relacional e manipulação de dados utilizando SQL.

O trabalho consiste na criação completa de um banco de dados para uma **academia**, incluindo:
- Mapa Conceitual (EER);
- Modelagem Entidade-Relacionamento (ER);
- Definição de entidades fortes, fracas, heranças e relacionamentos;
- Implementação das tabelas com **restrições de integridade** (`PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`);
- Povoamento das tabelas com dados fictícios;
- Desenvolvimento de consultas SQL que envolvem:
  - `GROUP BY / HAVING`
  - `INNER JOIN`
  - `OUTER JOIN`
  - `SEMI-JOIN`
  - `ANTI-JOIN`
  - Subconsultas (`ESCALAR`, `LINHA`, `TABELA`)
  - Operações de conjunto

---

## 📚 Contexto do Banco de Dados
O sistema gerencia informações como:
- Planos da academia;
- Alunos, funcionários, instrutores e personal trainers;
- Equipamentos e exercícios;
- Avaliações físicas;
- Fichas de treino e execuções;
- Contratações de planos;
- Acompanhantes e contatos.

O modelo contempla relacionamentos complexos como M:N e N-ários, além de heranças e entidades fracas.

---

## 🛠 Exemplo de Entidades e Relacionamentos
- **Entidades Fortes:** Plano, Personal_Trainer, Equipamento, Exercício
- **Entidades Fracas:** Acompanhante, ContatoAc
- **Herança:** Usuário_da_Academia → Aluno / Funcionário → Instrutor / Administração
- **Relacionamentos:** Tem, Contratou, Realiza, FT_POSSUI_Ex

---

## 🧠 Objetivos do Projeto
- Garantir a integridade referencial dos dados
- Simular operações reais de uma academia
- Explorar todos os principais tipos de consultas SQL
- Demonstrar o uso de procedimentos armazenados com parâmetros

---

## 👨‍💻 Colaboradores

| [<img src="https://avatars.githubusercontent.com/u/145587864?v=4" width=115><br><sub>Álvaro Brandão Neto</sub>](https://github.com/MonstroHormonal) | [<img src="https://avatars.githubusercontent.com/u/129231720?v=4" width=115><br><sub>Henrique César Higino Holanda Cordeiro</sub>](https://github.com/SapoSopa) | [<img src="https://avatars.githubusercontent.com/u/124618168?v=4" width=115><br><sub>Lara Vieira Luchi</sub>](https://github.com/LaraLuchi) | [<img src="https://avatars.githubusercontent.com/u/159057394?v=4" width=115><br><sub>Matheus Henrique Menezes da Silva</sub>](https://github.com/MatheusMenezesss) | [<img src="https://avatars.githubusercontent.com/u/126609244?v=4" width=115><br><sub>Nathan Barbosa dos Santos</sub>](https://github.com/sannathan) |
| :---: | :---: | :---: | :---: | :---: |