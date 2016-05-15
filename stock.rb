require_relative "counter"

class Estoque
    attr_reader :livros
  def initialize
    @livros = []
    @vendas = []
    @livros.extend Contador
  end

  def quantidade_de_vendas_de_titulo(produto, &campo)
    @vendas.count {|venda| campo.call(venda) == campo.call(produto)}
  end
  def que_mais_vendeu_por(tipo, &campo)
    @vendas.select {|l| l.tipo == tipo}.sort {|v1, v2|
      quantidade_de_vendas_de_titulo(v1, &campo) <=> quantidade_de_vendas_de_titulo(v2, &campo)
    }.last
  end
  def livro_que_mais_vendeu_por_titulo
    que_mais_vendeu_por("livro", &:titulo)
  end

  def livro_que_mais_vendeu_por_ano
    que_mais_vendeu_por("livro", &:ano_lancamento)
  end
  def livro_que_mais_vendeu_por_editora
    que_mais_vendeu_por("livro", &:editora)
  end
  def revista_que_mais_vendeu_por_titulo
    que_mais_vendeu_por("revista", &:titulo)
  end
  def revista_que_mais_vendeu_por_ano
    que_mais_vendeu_por("revista", &:ano_lancamento)
  end
  def revista_que_mais_vendeu_por_editora
    que_mais_vendeu_por("revista", &:editora)
  end
  #metodo que imprime os livros
  def gera_csv
    @livros.each do |livro|
      puts livro.to_csv
    end
  end
  #metodo que compara quais são os livros mais baratos
  def mais_baratos_que(valor)
    @livros.select do |livro|
      livro.preco <= valor
    end
  end
  #metodo que calcula o total de livros do objeto estoque
  def total
    @livros.size
  end
  #metodo para adicionar livros que estejam no padrão (segundo o construtor) no objeto estoque.
  def <<(livro)
    @livros << livro if livro
  end
  def vende(livro)
    @livros.delete livro
    @vendas << livro
  end
  def maximo_necessario
    @livros.maximo_necessario
  end
end
