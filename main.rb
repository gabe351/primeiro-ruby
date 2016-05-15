require_relative "product"
require_relative "stock"
require_relative "magazine"
require_relative "ebook"
require_relative "book"

#Livro --> Titulo, Preco, ano_de_lancamento,possui_reimpressao, possui_sobrecapa, editora
#revista --> Titulo, preco, possui_reimpressao, numero, editora
#ebook --> Titulo, preco, ano_de_lancamento, editora

algoritimo = Livro.new("algoritimo", 130, 1998, true, true,"editora")
gerencia_de_projetos = EBook.new("Gerentes Manjadores", 50, 2001,"editora")
vida_de_chid = Livro.new("Chid, um gato fora do normal",  30, 2010, true, true,"editora")
gijo = EBook.new("A preguica e uma mae e deve ser respeitada", 80, 1998,"editora")
gijomagazine = Magazine.new("revista de gijo", 30, true, 24, "Papai records")
online_book = EBook.new("ebook", 50, 2012, "editora")
stock = Estoque.new

#adicionando objeto LIVRO na classe ESTOQUE
stock << algoritimo << algoritimo
stock << gerencia_de_projetos << gerencia_de_projetos
stock << vida_de_chid << vida_de_chid
stock << gijo << gijo << gijo << gijo << gijomagazine << gijomagazine
stock << online_book

stock.vende gijo
stock.vende gijomagazine
stock.vende gijomagazine
stock.vende algoritimo
stock.vende gijo
stock.vende online_book

puts stock.livro_que_mais_vendeu_por_titulo.titulo
puts stock.revista_que_mais_vendeu_por_titulo.titulo
puts stock.ebook_que_mais_vendeu_por_titulo.titulo
puts stock.respond_to?(:ebook_que_mais_vendeu_por_titulo)

#baratos = estoque.mais_baratos_que(80)
#baratos.each do |livro|
#  puts "Ta barato o : #{livro.titulo}"
#end #pq esse end aqui...

#estoque.total
#estoque.gera_csv
