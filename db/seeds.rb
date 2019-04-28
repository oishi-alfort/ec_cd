# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Artist.create(artist_name: 'Camila Cabello', artist_profile: 'Karla Camila Cabello Estrabao, born March 3, 1997 is a Cuban-American singer and songwriter. She rose to prominence as a member of the girl group Fifth Harmony, formed on The X Factor (U.S.) in 2012, signing a joint record deal with Syco Music and Epic Records.')
Artist.create(artist_name: 'Ariana Grande', artist_profile: 'Ariana Grande-Butera, born June 26, 1993 is an American singer, songwriter and actress. Born in Florida to a family of New York-Italian origin, she began her career in 2008 in the Broadway musical 13, before playing the role of Cat Valentine in the Nickelodeon television series Victorious (2010–13) and in its spinoff Sam & Cat (2013–14). Grande made her first musical appearance on the soundtrack for Victorious and was signed to Republic Records in 2011 after music executive Monte Lipman came across one of her YouTube videos covering songs.')
Cd.create(cd_title: 'Thank u, Next', stock: 5, cd_profile: '"Thank U, Next" is a song by American singer Ariana Grande, released as the lead single from her fifth studio album of the same name (2019). The song was released on November 3, 2018, without any prior official announcement or promotion. The track was written by Grande, Tayla Parx and Victoria Monét, along with its producers Tommy Brown, Charles Anderson and Michael Foster. Lyrically, the song reflects on Grandes past relationships.', price: 10, artist_id: 2)
Cd.create(cd_title: 'Havana', stock: 5, cd_profile: '"Havana" is a song recorded by Cuban-American singer Camila Cabello featuring guest vocals from American rapper Young Thug. It was released on August 3, 2017, along with "OMG", from her solo debut album Camila. In August 2017, Cabello confirmed the song as the albums second single. It was serviced to radio on September 8, 2017. Due to its rising success, "Havana" later became the official lead single of Camila, replacing "Crying in the Club". In November 2017, a remix version of the song with Puerto Rican rapper Daddy Yankee was uploaded to Cabellos YouTube page. The first verse of the remix is sung in Spanish while Daddy Yankee replaces Young Thugs verse.', price: 10, artist_id: 1)
Category.create(category_name: 'J-Pop')
Category.create(category_name: 'Rock')
Category.create(category_name: 'Rap')
Category.create(category_name: 'Soul')
Category.create(category_name: 'Country')
Category.create(category_name: 'Jazz')
Label.create(label_name: 'Sony Music')
Label.create(label_name: 'Universal Music')