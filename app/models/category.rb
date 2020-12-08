class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ベビー・キッズ' },
    { id: 3, name: 'インテリア・住まい・小物' },
    { id: 4, name: 'スポーツ・レジャー' },
    { id: 5, name: 'おもちゃ・ホビー・グッズ' },
    { id: 6, name: 'レディース' },
    { id: 7, name: 'メンズ' },
    { id: 8, name: '家電製品' },
    { id: 9, name: 'グルメ' },
    { id: 10, name: 'その他' }
  ]
 
   include ActiveHash::Associations
   has_many :item
end
