class Livro
  attr_reader :titulo, :preco, :ano_lancamento, :reimpressao, :editora, :tipo
  #construtor do objeto
  def initialize(titulo, preco, ano_lancamento, reimpressao, editora, tipo)
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @preco = calcula_preco(preco)
    @reimpressao = reimpressao
    @editora = editora
    @tipo = tipo
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
