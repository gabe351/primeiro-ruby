class Livro #criando classe.
  attr_reader :titulo, :preco, :ano_lancamento
  def initialize(titulo, preco, ano_lancamento) #criando construtor
    @titulo = titulo #o @ referencia o this.atributo?
    @preco = preco
    @ano_lancamento = ano_lancamento
  end
end

livro_rails = Livro.new("Agile web development with rails", 80, 2011) # a ordem de chamada do construtor aparece nesta ordem

livro_ruby = Livro.new("Programing Ruby 1.9", 60, 2010)

gijo = Livro.new("A preguica eh uma mae e deve ser respeitada", 80, 1998)
livros=[livro_ruby, livro_rails, gijo] #array com os dois livros criados

def imprime_nota_fiscal(livros) #método para imprimir os livros na tela
  livros.each do |livro| #Tipo um ciclo de repetição para verificar os livros e printar o que tá embaixo
    puts "Titulo: #{livro.titulo} - #{livro.preco} reais." #print em Ruby
  end
end
imprime_nota_fiscal livros #chamando método + array
