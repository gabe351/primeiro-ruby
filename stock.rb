class Estoque
    attr_reader :livros
  def initialize
    @livros = []
    @livros.extend Contador
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
  def remove(livro)
    @livros.delete livro
    self
  end
  def maximo_necessario
    @livros.maximo_necessario
  end
end
