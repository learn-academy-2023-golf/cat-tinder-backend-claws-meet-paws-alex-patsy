cats = [
    {
        name: 'Toast',
        age: 6,
        enjoys: 'Chewing on plants',
        image: 'https://www.instagram.com/p/CRb0zijHyWuBCkud6OerCRJVBcg4D53UAT1xcs0/'
    }, 
    {
        name: 'Fluff',
        age: 6, 
        enjoys: 'Nice Pets',
        image: 'https://www.instagram.com/p/CbgImoUlkg2pq1xqyCgYKbeSnvHTyJ5wX-BW940/' 
    }
]

cats.each do |cat_attributes| 
    Cat.create cat_attributes
    puts "created cat: #{cat_attributes}"
end




