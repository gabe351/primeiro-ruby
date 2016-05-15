module Product
  attr_reader :titulo, :preco, :editora

  def initialize(titulo, preco, editora)
    @titulo = titulo
    @preco = preco
    @editora = editora
  end

  def to_csv
      puts "Titulo: #{@titulo}, custa #{@preco} reais e foi lancado por #{@editora}"
  end
end
