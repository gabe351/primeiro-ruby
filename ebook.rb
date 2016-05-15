require_relative "product"

class EBook
  attr_reader  :ano_lancamento
  include Product
  #construtor do objeto
  def initialize(titulo, preco, ano_lancamento, editora)
    super(titulo, preco, editora)
    @ano_lancamento = ano_lancamento
  end

  def matches?(query)
    ["ebook", "digital"].include?(query)
  end

end
