require_relative "book"
require_relative "stock"
require_relative "counter"



algoritimo = Livro.new("algoritimo", 130, 1998, true)
gerencia_de_projetos = Livro.new("Gerentes Manjadores", 50, 2001, false)
vida_de_chid = Livro.new("Chid, um gato fora do normal",  30, 2010, true)
gijo = Livro.new("A preguica e uma mae e deve ser respeitada", 80, 1998, true)

estoque = Estoque.new
#adicionando objeto LIVRO na classe ESTOQUE
estoque << algoritimo
estoque << gerencia_de_projetos
puts estoque.maximo_necessario
estoque << vida_de_chid
estoque << gijo

estoque.remove algoritimo

#baratos = estoque.mais_baratos_que(80)
#baratos.each do |livro|
#  puts "Ta barato o : #{livro.titulo}"
#end #pq esse end aqui...

#estoque.total
#estoque.gera_csv
