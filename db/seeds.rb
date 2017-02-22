tags = ['banana', 'music', 'potato', 'pineapple', 'dog']
description = 'This one was very carefully picked. Besides, he is so unique, he is so fantastic that women are crying and guys are not' 
categories = ['good things', 'bad things', 'neutral things', 'other things']

unless Thing.any?
  100.times do |t|
    Thing.create(title: "Thing numero #{t+1}", description: description,
                 tags: tags.sample(2), category: categories.sample,
                 address: "Some address #{t+1}")
  end
end