require 'faker'

100.times do 
    name = Faker::Lorem.sentence(word_count: 1, random_words_to_add: 9)
    description = Faker::Lorem.paragraph(sentence_count: 1, random_sentences_to_add: 2)
    date = Faker::Time.between_dates(from: Date.today - 90, to: Date.today + 90, period: :all)
    Deadline.create(name: name,
                    description: description,
                    date: date
                   )
end
