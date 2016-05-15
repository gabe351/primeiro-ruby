require_relative "counter"

class Estoque
    attr_reader :livros
  def initialize
    @livros = []
    @vendas = []
    @livros.extend Contador
  end



  #pedir explicação melhor do chid sobre!!
  def method_missing(name)
    matcher = name.to_s.match "(.+)_que_mais_vendeu_por_(.+)"
    if matcher
      tipo = matcher[1]
      campo = matcher[2].to_sym #to_s passa para String e o to_sym, passa pra...
      que_mais_vendeu_por(tipo, &campo)
    else
      super
    end
  end

  def respond_to?(name)
    matched = name.to_s.match ("(.+)_que_mais_vendeu_por_(.+)")
    !!(matched) || super
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

  private
  def quantidade_de_vendas_de_titulo(produto, &campo)
    @vendas.count {|venda| campo.call(venda) == campo.call(produto)}
  end
  def que_mais_vendeu_por(tipo, &campo)
    @vendas.select {|produto| produto.matches?(tipo)}.sort {|v1, v2|
      quantidade_de_vendas_de_titulo(v1, &campo) <=> quantidade_de_vendas_de_titulo(v2, &campo)
    }.last
  end
end
