require_relative "product"

class Magazine
  attr_reader :possui_reimpressao, :numero
  include Product
  #construtor do objeto
  def initialize(titulo, preco, possui_reimpressao, numero, editora)
    super(titulo, preco, editora)
    @possui_reimpressao = possui_reimpressao
    @numero = numero
  end

  def matches?(query)
    ["revista", "impresso"].include?(query)
  end
end
