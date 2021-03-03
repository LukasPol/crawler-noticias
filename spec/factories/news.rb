FactoryBot.define do
  factory :news do
    source_news { 'Secretaria Especial da Cultura' }
    url { 'http://cultura.gov.br/secretaria-especial-da-cultura-por-meio-do-iphan-lanca-campanha-de-fomento-ao-patrimonio-cultural-imaterial/' }
    date_publish { Date.today }
    date_crawler { Date.today }
    title { 'Secretaria Especial da Cultura, por meio do Iphan lança campanha de fomento ao Patrimônio Cultural Imaterial' }
    caption { 'A ação visa promover bens registrados e produtos associados. A chamada pública para adesão segue aberta.' }
    body { FFaker::Lorem.characters }
  end
end