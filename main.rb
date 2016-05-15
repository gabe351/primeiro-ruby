require_relative "book"
require_relative "stock"



algoritimo = Livro.new("algoritimo", 130, 1998, true, "editora", "livro")
gerencia_de_projetos = Livro.new("Gerentes Manjadores", 50, 2001, false, "editora", "livro")
vida_de_chid = Livro.new("Chid, um gato fora do normal",  30, 2010, true,"editora", "livro")
gijo = Livro.new("A preguica e uma mae e deve ser respeitada", 80, 1998, true,"editora", "livro")
gijomagazine = Livro.new("revista de gijo", 25, 2016, false,"Papai records", "revista")
estoque = Estoque.new

#adicionando objeto LIVRO na classe ESTOQUE
estoque << algoritimo << algoritimo
estoque << gerencia_de_projetos << gerencia_de_projetos
estoque << vida_de_chid << vida_de_chid
estoque << gijo << gijo << gijo << gijo << gijomagazine << gijomagazine

estoque.vende gijo
estoque.vende gijomagazine
estoque.vende gijomagazine
estoque.vende algoritimo
estoque.vende gijo

puts estoque.revista_que_mais_vendeu_por_titulo.titulo
puts estoque.livro_que_mais_vendeu_por_titulo.titulo

#baratos = estoque.mais_baratos_que(80)
#baratos.each do |livro|
#  puts "Ta barato o : #{livro.titulo}"
#end #pq esse end aqui...

#estoque.total
#estoque.gera_csv
