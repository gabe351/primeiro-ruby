require_relative "product"

class Livro
  attr_reader  :ano_lancamento, :possui_reimpressao, :possui_sobrecapa
  include Product
  #construtor do objeto
  def initialize(titulo, preco, ano_lancamento, possui_reimpressao, possui_sobrecapa, editora)
    super(titulo, preco, editora)
    @ano_lancamento = ano_lancamento
    @possui_reimpressao = possui_reimpressao
    @possui_sobrecapa = possui_sobrecapa
  end

  def matches?(query)
    ["livro", "impresso"].include?(query)
  end

  def tipo
    "livro"
  end
  #metodo para chamar os livros.
  private #criando um método private
  #metodo para fazer as promoções dos livros
  #def calcula_preco(base)
  #  if @ano_lancamento>2006
  #    if @reimpressao
  #      base*0.9
  #    else
  #      base*0.95
  #    end
  #  elsif @ano_lancamento <= 2010
  #    base*0.96
  #  else
  #    base
  #  end
  #end
end
