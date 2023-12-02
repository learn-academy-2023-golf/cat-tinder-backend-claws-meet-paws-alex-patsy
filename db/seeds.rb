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
        enjoys: 'Nice Pets and toys.',
        image: 'https://www.instagram.com/p/CbgImoUlkg2pq1xqyCgYKbeSnvHTyJ5wX-BW940/' 
    },
    {
        name: 'Jam',
        age: 4, 
        enjoys: 'Hugs and Catnip!',
        image: 'https://i.ytimg.com/vi/nMMPCVgD-BQ/maxresdefault.jpg' 
    }, 
    {
        name: 'Mike',
        age: 8, 
        enjoys: 'Food',
        image: 'https://img1.cgtrader.com/items/2493637/d6b885cbd1/large/mike-cat-3d-model-low-poly-animated-obj.jpg'
    }
    
]

cats.each do |cat_attributes| 
    Cat.create cat_attributes
    puts "created cat: #{cat_attributes}"
end




