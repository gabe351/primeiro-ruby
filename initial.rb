class Livro
  attr_reader :titulo, :preco, :ano_lancamento, :reimpressao
  #construtor do objeto
  def initialize(titulo, preco, ano_lancamento, reimpressao)
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @preco = calcula_preco(preco)
    @reimpressao = reimpressao
  end
  #metodo para chamar os livros.
  def to_csv
      puts "Titulo: #{@titulo}, Foi lancado em #{@ano_lancamento} e custa #{@preco} reais"
  end

  private #criando um método private
  #metodo para fazer as promoções dos livros
  def calcula_preco(base)
    if @ano_lancamento>2006
      if @reimpressao
        base*0.9
      else
        base*0.95
      end
    elsif @ano_lancamento <= 2010
      base*0.96
    else
      base
    end
  end
end
#classe estoque que armazena os livros.
class Estoque
    def initialize
    @livros = []
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
  def adiciona(livro)
    @livros << livro if livro
  end
end




#criando objetos do tipo LIVRO

algoritimo = Livro.new("algoritimo", 130, 1998, true)
gerencia_de_projetos = Livro.new("Gerentes Manjadores", 50, 2001, false)
vida_de_chid = Livro.new("Chid, um gato fora do normal",  30, 2010, true)


estoque = Estoque.new
#adicionando objeto LIVRO na classe ESTOQUE
estoque.adiciona algoritimo
estoque.adiciona gerencia_de_projetos
estoque.adiciona vida_de_chid
estoque.adiciona Livro.new("A preguica e uma mae e deve ser respeitada", 80, 1998, true)

baratos = estoque.mais_baratos_que(80)
baratos.each do |livro|
  puts "Ta barato o : #{livro.titulo}"
end #pq esse end aqui...

estoque.total
estoque.gera_csv
