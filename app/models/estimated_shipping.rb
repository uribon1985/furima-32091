class EstimatedShipping < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '当日発送' },
    { id: 3, name: '1~2日で発送' },
    { id: 4, name: '3~4日で発送' },
    { id: 5, name: '5~6日で発送' },
    { id: 6, name: '7~10日で発送' },
    { id: 7, name: '1ヶ月以上' },
  ]
 
   include ActiveHash::Associations
   has_many :item
end
